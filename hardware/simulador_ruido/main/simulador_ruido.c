#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "esp_system.h"
#include "nvs_flash.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_netif.h"
#include "mqtt_client.h"
#include "wifi_config.h"  // Este archivo debe definir WIFI_SSID y WIFI_PASSWORD

// Certificado CA embebido
extern const uint8_t ca_cert_pem_start[] asm("_binary_ca_cert_pem_start");
extern const uint8_t ca_cert_pem_end[]   asm("_binary_ca_cert_pem_end");

extern const uint8_t client_cert_pem_start[] asm("_binary_client_cert_pem_start");
extern const uint8_t client_cert_pem_end[]   asm("_binary_client_cert_pem_end");

extern const uint8_t client_key_pem_start[] asm("_binary_client_key_pem_start");
extern const uint8_t client_key_pem_end[]   asm("_binary_client_key_pem_end");



static const char *TAG = "SIMULADOR_RUIDO";
esp_mqtt_client_handle_t mqtt_client = NULL;

uint32_t esp_random(void);  // Declaración explícita del generador aleatorio

// ========================================
// 🛰️ Publicador de niveles de ruido
// ========================================
void simulador_ruido_task(void *pvParameter)
{
    ESP_LOGI(TAG, "Tarea de simulación iniciada");

    while (1) {
        uint32_t ruido_db = 60 + (esp_random() % 10);  // Ruido entre 60 y 69 dB

        char mensaje[64];
        snprintf(mensaje, sizeof(mensaje), "{\"ruido\": %" PRIu32 "}", ruido_db);

        esp_mqtt_client_publish(mqtt_client, "iot/ruido", mensaje, 0, 1, 0);
        ESP_LOGI(TAG, "Publicado: %s", mensaje);

        vTaskDelay(pdMS_TO_TICKS(30000));  // Esperar 30 segundos
    }
}

// ========================================
// 📶 Manejador de eventos WiFi
// ========================================
static void wifi_event_handler(void* arg, esp_event_base_t event_base,
                               int32_t event_id, void* event_data)
{
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        ESP_LOGW(TAG, "Wi-Fi desconectado, reintentando...");
        esp_wifi_connect();
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t* event = (ip_event_got_ip_t*) event_data;
        ESP_LOGI(TAG, "Conectado! IP ESP32: " IPSTR, IP2STR(&event->ip_info.ip));
    }
}

// ========================================
// 🔌 Inicialización de WiFi
// ========================================
void wifi_init(void)
{
    esp_netif_init();
    esp_event_loop_create_default();
    esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    esp_wifi_init(&cfg);

    esp_event_handler_instance_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL, NULL);
    esp_event_handler_instance_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL, NULL);

    wifi_config_t wifi_config = {
        .sta = {
            .ssid = WIFI_SSID,
            .password = WIFI_PASSWORD,
        },
    };

    esp_wifi_set_mode(WIFI_MODE_STA);
    esp_wifi_set_config(WIFI_IF_STA, &wifi_config);
    esp_wifi_start();

    ESP_LOGI(TAG, "Conectando a red Wi-Fi: %s...", WIFI_SSID);
}

// ========================================
// 🔐 Evento de conexión MQTT
// ========================================
static void mqtt_event_handler_cb(void *handler_args, esp_event_base_t base, int32_t event_id, void *event_data)
{
    esp_mqtt_event_handle_t event = (esp_mqtt_event_handle_t)event_data;

    switch (event->event_id) {
        case MQTT_EVENT_CONNECTED:
            ESP_LOGI(TAG, "✅ Conectado al broker MQTT (TLS)");
            break;
        case MQTT_EVENT_DISCONNECTED:
            ESP_LOGW(TAG, "⚠️ Desconectado del broker MQTT");
            break;
        case MQTT_EVENT_ERROR:
            ESP_LOGE(TAG, "❌ Error en la conexión MQTT");
            break;
        default:
            break;
    }
}

// ========================================
// 🚀 Inicialización del cliente MQTT (TLS)
// ========================================
void mqtt_app_start(void)
{
    esp_mqtt_client_config_t mqtt_cfg = {
        .broker = {
            .address.uri = "mqtts://192.168.0.122:8883",
            .verification = {
                .certificate = (const char *)ca_cert_pem_start,
                .certificate_len = (ca_cert_pem_end - ca_cert_pem_start),
            }
        },
        .credentials = {
            .authentication = {
                .certificate = (const char *)client_cert_pem_start,
                .certificate_len = (client_cert_pem_end - client_cert_pem_start),
                .key = (const char *)client_key_pem_start,
                .key_len = (client_key_pem_end - client_key_pem_start),
            }
        }
    };

    mqtt_client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_register_event(mqtt_client, ESP_EVENT_ANY_ID, mqtt_event_handler_cb, NULL);
    esp_mqtt_client_start(mqtt_client);
}




// ========================================
// 🧠 Punto de entrada principal
// ========================================
void app_main(void)
{
    ESP_LOGI(TAG, "Inicio del sistema");

    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ESP_ERROR_CHECK(nvs_flash_init());
    }

    wifi_init();
    mqtt_app_start();
    xTaskCreate(&simulador_ruido_task, "simulador_ruido_task", 4096, NULL, 5, NULL);
}
