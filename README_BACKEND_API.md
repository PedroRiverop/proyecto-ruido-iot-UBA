# 📡 API Backend - Sistema IoT de Monitoreo de Ruido

Este backend forma parte del sistema IoT para medir niveles de ruido usando ESP32, MQTT con TLS y MongoDB. Las rutas REST permiten acceder a las mediciones registradas, almacenadas en la base de datos.

## 🔧 Requisitos

- Docker
- Docker Compose
- Node.js v20
- MongoDB (ya incluido como servicio Docker)

## 🚀 Endpoints disponibles

### 📍 Última lectura
```
GET /api/datos/latest
```
Devuelve la última lectura registrada.

---

### 📚 Todas las lecturas
```
GET /api/datos
```
Devuelve todas las lecturas ordenadas cronológicamente.

---

### ⏳ Últimas N lecturas
```
GET /api/datos/ultimas?limit=3
```
Devuelve las últimas `N` lecturas. Por defecto son 10 si no se especifica `limit`.

---

### 🕒 Lecturas desde una fecha
```
GET /api/datos/desde?fecha=2025-04-20T00:00:00.000Z
```
Devuelve todas las lecturas a partir de la fecha especificada en formato ISO 8601.

---

### ✍️ Insertar manualmente (para pruebas)
```
POST /api/datos
Content-Type: application/json

{
  "topic": "iot/ruido",
  "timestamp": "2025-04-24T12:00:00.000Z",
  "ruido": 65
}
```

## 🔍 Testing con Postman

Importá el archivo `DAIoT_MQTT_API.postman_collection.json` en Postman para probar todas las rutas rápidamente.

---

## 📂 Estructura del proyecto

```
/backend
├── src/
│   ├── server.js
│   └── api/
│       └── datos.js
├── certs/ (montados desde docker/mosquitto/certs)
└── .env
```

## 🐳 Docker Compose

El backend se lanza con MongoDB y Mosquitto (con TLS) mediante `docker-compose up -d`.

---

## 🧠 Autor

Pedro Rivero Peña - FIUBA | Proyecto DAIoT 2025