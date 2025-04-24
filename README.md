# Sistema IoT de Monitoreo de Ruido Ambiental

Este proyecto es un sistema completo de monitoreo de ruido ambiental desarrollado como parte del Trabajo Final de la carrera de Especialización en Internet de las Cosas (FIUBA). El sistema utiliza sensores conectados a dispositivos ESP32 que publican datos vía MQTT con TLS hacia un backend Node.js, el cual almacena los datos en MongoDB y expone una API REST. El frontend en React consume esta API y muestra información en tiempo real de forma moderna y dinámica.

---

## 🧩 Componentes del Proyecto

### 🔧 Hardware (simulado en esta etapa)
- ESP32 clásico o ESP32-C3
- Simulación de mediciones de ruido cada 30 segundos

### 📡 Comunicación
- **MQTT sobre TLS (mutua autenticación)** usando Mosquitto (en contenedor Docker)
- Tópico: `iot/ruido`

### 🔙 Backend
- Node.js + Express
- MongoDB para persistencia
- MQTT.js para suscripción y recepción de datos
- Server-Sent Events (SSE) para transmisión en tiempo real al frontend
- Rutas REST para consultar última lectura, últimas N lecturas, lecturas desde una fecha, y exportación

###  Frontend
- React + Bootstrap + React Icons + Recharts
- Dashboard con:
  - Última lectura en tiempo real
  - Alerta dinámica y creativa si el valor alcanza 69 dB
  - Gráfico de evolución de las últimas lecturas
  - Minimapa de actividad del día (min, max, promedio)
  - Indicador visual del nivel de ruido
- Otras vistas:
  - Últimas N lecturas configurables
  - Historial desde fecha y hora
  - Exportación de datos a CSV
  - Umbral de alerta personalizable

---

##  Docker

El sistema se compone de:
- `mosquitto`: Broker MQTT seguro
- `mongo`: Base de datos MongoDB
- `backend`: Backend Node.js
- `frontend`: Interfaz React

---

##  Instrucciones de uso

```bash
git clone https://github.com/usuario/proyecto-ruido-iot
cd proyecto-ruido-iot
docker-compose up --build
```

---

## 🏫 Créditos

**Autor:** Pedro Rivero Peña  
**Institución:** Facultad de Ingeniería - Universidad de Buenos Aires (FIUBA)  
**Especialización:** Internet de las Cosas  
**Fecha:** 24/04/2025

---

## 📃 Licencia

Uso académico - Todos los derechos reservados.
