import React, { useState } from 'react';
import axios from 'axios';
import { LineChart, Line, XAxis, YAxis, Tooltip, CartesianGrid, ResponsiveContainer } from 'recharts';
import ExportarDatos from '../components/ExportarDatos.jsx';

const HistorialLecturas = () => {
  const [fecha, setFecha] = useState('');
  const [datos, setDatos] = useState([]);
  const [error, setError] = useState('');

  const obtenerHistorial = async () => {
    if (!fecha) return;

  // Convertir a formato UTC (ISO 8601)
  const fechaISO = new Date(fecha).toISOString();

  axios.get(`http://localhost:3000/api/datos/desde?fecha=${fechaISO}`)
    .then((res) => {
      setDatos(res.data);
    })
    .catch((err) => {
      console.error('❌ Error al obtener historial:', err);
    });
  };

  return (
    <div className="card mt-4 p-4 shadow">
      <h3 className="mb-3">Historial desde fecha</h3>

      <div className="mb-3">
        <label htmlFor="fecha" className="form-label">Seleccioná fecha y hora:</label>
        <input
          type="datetime-local"
          id="fecha"
          className="form-control"
          value={fecha}
          onChange={(e) => setFecha(e.target.value)}
        />
      </div>

      <button onClick={obtenerHistorial} className="btn btn-primary mb-3">
        Consultar historial
      </button>

      {error && <div className="alert alert-danger">{error}</div>}

      {datos.length > 0 && (
        <>
          <h5>Resultados: {datos.length}</h5>
          <div className="table-responsive">
            <table className="table table-striped">
              <thead>
                <tr>
                  <th>Fecha</th>
                  <th>Ruido (dB)</th>
                  <th>Tópico</th>
                </tr>
              </thead>
              <tbody>
                {datos.map((d) => (
                  <tr key={d._id}>
                    <td>{new Date(d.timestamp).toLocaleString()}</td>
                    <td>{d.ruido}</td>
                    <td>{d.topic}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={datos} margin={{ top: 20, right: 30, left: 0, bottom: 5 }}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="timestamp" tickFormatter={(str) => new Date(str).toLocaleTimeString()} />
              <YAxis domain={['auto', 'auto']} />
              <Tooltip labelFormatter={(str) => new Date(str).toLocaleString()} />
              <Line type="monotone" dataKey="ruido" stroke="#007bff" dot={false} />
            </LineChart>
          </ResponsiveContainer>
        </>
      )}
      <ExportarDatos />
    </div>
  );
};

export default HistorialLecturas;
