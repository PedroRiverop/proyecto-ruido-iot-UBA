import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { FaListOl, FaClock, FaVolumeUp } from 'react-icons/fa';
import {
    LineChart,
    Line,
    XAxis,
    YAxis,
    Tooltip,
    CartesianGrid,
    ResponsiveContainer,
    Legend
  } from 'recharts';

const UltimasLecturas = () => {
  const [lecturas, setLecturas] = useState([]);
  const [limite, setLimite] = useState(5);

  useEffect(() => {
    axios.get(`http://localhost:3000/api/datos/ultimas?limit=${limite}`)
      .then(res => {
        console.log('📦 Datos recibidos:', res.data);
    setLecturas(res.data);
  })
      .catch(err => console.error('Error al obtener lecturas:', err));
  }, [limite]);

  return (
    <div className="card mt-4 shadow">
      <div className="card-body">
        <h3 className="card-title"><FaListOl className="me-2 text-secondary" />Últimas {limite} lecturas</h3>
        
        <div className="mb-3">
          <label htmlFor="limiteInput" className="form-label">Mostrar cantidad:</label>
          <input
            id="limiteInput"
            type="number"
            className="form-control w-25 mx-auto"
            value={limite}
            min={1}
            max={50}
            onChange={(e) => setLimite(Number(e.target.value))}
          />
        </div>

        <ul className="list-group list-group-flush">
          {lecturas.map((dato, index) => (
            <li key={index} className="list-group-item d-flex justify-content-between align-items-center">
              <span><FaClock className="me-2 text-muted" />{new Date(dato.timestamp).toLocaleString()}</span>
              <span><FaVolumeUp className="me-2 text-primary" />{dato.ruido} dB</span>
            </li>
          ))}
        </ul>
      </div>
      
      {lecturas.length > 0 && (
  <div className="mt-5">
    <h5 className="text-center">Gráfico de evolución del ruido</h5>
    <ResponsiveContainer width="100%" height={300}>
      <LineChart data={[...lecturas].reverse()}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="timestamp" tickFormatter={(tick) => new Date(tick).toLocaleTimeString()} />
        <YAxis />
        <Tooltip labelFormatter={(value) => new Date(value).toLocaleString()} />
        <Legend />
        <Line type="monotone" dataKey="ruido" stroke="#007bff" dot={false} />
      </LineChart>
    </ResponsiveContainer>
  </div>
)}


    </div>
  );
};

export default UltimasLecturas;
