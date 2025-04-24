// Conexión a MongoDB
const { MongoClient } = require('mongodb');

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

let db;

async function connectToMongo() {
  if (!db) {
    await client.connect();
    db = client.db(); // se puede especificar .db('ruido_iot') si fuera necesario
  }
  return db;
}

module.exports = { connectToMongo };
