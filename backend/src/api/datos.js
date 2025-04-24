// src/api/datos.js
const express = require('express');
const router = express.Router();
const { connectToMongo } = require('../db/mongo');

// GET /api/datos/latest
router.get('/latest', async (req, res) => {
  try {
    const db = await connectToMongo();
    const collection = db.collection('lecturas');
    const ultima = await collection.find().sort({ timestamp: -1 }).limit(1).toArray();

    if (ultima.length === 0) {
      return res.status(404).json({ error: 'No hay datos disponibles' });
    }

    res.json(ultima[0]);
  } catch (err) {
    console.error('❌ Error al obtener última lectura:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// GET /api/datos
router.get('/', async (req, res) => {
  try {
    const db = await connectToMongo();
    const collection = db.collection('lecturas');
    const datos = await collection.find().sort({ timestamp: 1 }).toArray();
    res.json(datos);
  } catch (err) {
    console.error('❌ Error al obtener todos los datos:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// GET /api/datos/ultimas?limit=N   http://localhost:3000/api/datos/ultimas?limit=3"
router.get('/ultimas', async (req, res) => {
  const limit = parseInt(req.query.limit) || 10;

  try {
    const db = await connectToMongo();
    const collection = db.collection('lecturas');
    const datos = await collection.find().sort({ timestamp: -1 }).limit(limit).toArray();
    res.json(datos.reverse()); // Orden cronológico ascendente
  } catch (err) {
    console.error('❌ Error al obtener últimas lecturas:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// GET /api/datos/desde?fecha=YYYY-MM-DDTHH:mm:ssZ
router.get('/desde', async (req, res) => {
  const fecha = req.query.fecha;

  if (!fecha) {
    return res.status(400).json({ error: 'Parámetro "fecha" requerido' });
  }

  try {
    const desde = new Date(fecha);
    if (isNaN(desde.getTime())) {
      return res.status(400).json({ error: 'Formato de fecha inválido' });
    }

    const db = await connectToMongo();
    const collection = db.collection('lecturas');
    const datos = await collection.find({ timestamp: { $gte: desde } }).sort({ timestamp: 1 }).toArray();
    res.json(datos);
  } catch (err) {
    console.error('❌ Error al obtener datos desde fecha:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// POST /api/datos
router.post('/', async (req, res) => {
  const { ruido, timestamp = new Date() } = req.body;

  if (typeof ruido !== 'number') {
    return res.status(400).json({ error: 'Campo "ruido" debe ser un número' });
  }

  try {
    const db = await connectToMongo();
    const collection = db.collection('lecturas');
    const result = await collection.insertOne({ ruido, timestamp, topic: 'iot/ruido' });
    res.status(201).json({ _id: result.insertedId, ruido, timestamp });
  } catch (err) {
    console.error('❌ Error al insertar lectura manual:', err);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

module.exports = router;
