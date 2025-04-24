require('dotenv').config();
const fs = require('fs');
const mqtt = require('mqtt');
const express = require('express');
const { MongoClient } = require('mongodb');
const datosRoutes = require('./api/datos');

const cors = require('cors');



// =============================
// 🌐 Express App
// =============================
const app = express();

app.use(cors({
    origin: '*'
  }));

app.use(express.json());  

app.use('/api/datos', datosRoutes);
/*
La mejor forma para mostrar en tiempo real sin recargar la página es con SSE (Server-Sent Events) Dado que mi backend ya usa MQTT y Node.js, 
voy a usar SSE, que es más simple de implementar y muy eficiente para recibir solo datos desde el servidor hacia el cliente (ideal para mi dashboard)

- El backend tendrá una ruta como /api/stream que mantendrá la conexión abierta y enviará nuevos datos a medida que llegan.
- El frontend React abrirá esa conexión con EventSource.
- Cada vez que llegue un nuevo dato, se actualizará automáticamente el dashboard y el gráfico.
*/
let sseClients = [];

app.get('/api/stream', (req, res) => {
  res.setHeader('Content-Type', 'text/event-stream');
  res.setHeader('Cache-Control', 'no-cache');
  res.setHeader('Connection', 'keep-alive');
  res.flushHeaders();

  sseClients.push(res);
  console.log(`👥 Cliente SSE conectado (${sseClients.length} clientes activos)`);

  req.on('close', () => {
    sseClients = sseClients.filter(c => c !== res);
    console.log(`❌ Cliente SSE desconectado (${sseClients.length} restantes)`);
  });
});



const PORT = process.env.PORT || 3000;

// =============================
// 📦 MongoDB
// =============================
const mongoClient = new MongoClient(process.env.MONGODB_URI);
let db;

async function connectMongoDB() {
  try {
    await mongoClient.connect();
    db = mongoClient.db();
    console.log('✅ Conectado a MongoDB');
  } catch (error) {
    console.error('❌ Error al conectar a MongoDB:', error);
    process.exit(1);
  }
}

// =============================
// 📡 MQTT TLS
// =============================
const options = {
  clientId: process.env.CLIENT_ID,
  ca: fs.readFileSync(process.env.CA_CERT),
  cert: fs.readFileSync(process.env.CLIENT_CERT),
  key: fs.readFileSync(process.env.CLIENT_KEY),
  rejectUnauthorized: true
};

console.log('🔌 Conectando al broker MQTT...');
const client = mqtt.connect(process.env.MQTT_HOST, options);

client.on('connect', () => {
  console.log('✅ Conectado al broker MQTT con TLS');
  client.subscribe(process.env.MQTT_TOPIC, (err) => {
    if (err) {
      console.error('❌ Error al suscribirse al tópico:', err);
    } else {
      console.log('📡 Suscripción al tópico exitosa');
    }
  });
});


function enviarSSE(dato) {
    const data = `data: ${JSON.stringify(dato)}\n\n`;
    sseClients.forEach(client => client.write(data));
  } //Función para emitir datos a todos los clientes SSE
  

client.on('message', async (topic, message) => {
  try {
    const lectura = {
      topic,
      timestamp: new Date(),
      ruido: JSON.parse(message.toString()).ruido
    };
    console.log('📥 Mensaje recibido:', lectura);

    const collection = db.collection('lecturas');
    await collection.insertOne(lectura);
    console.log('💾 Guardado en MongoDB');
    enviarSSE(lectura);  // 📡 Enviar a frontend por SSE
  } catch (err) {
    console.error('❌ Error procesando el mensaje MQTT:', err);
  }
});

// =============================
// 🚀 Inicialización
// =============================
connectMongoDB().then(() => {
  app.listen(PORT, () => {
    console.log(`🌐 API REST escuchando en http://localhost:${PORT}`);
  });
});
