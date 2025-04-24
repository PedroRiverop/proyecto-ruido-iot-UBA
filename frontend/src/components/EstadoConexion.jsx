import React, { useEffect, useState } from 'react';
import { FaDatabase, FaWifi } from 'react-icons/fa';
import axios from 'axios';

const EstadoConexion = () => {
  const [estado, setEstado] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:3000/api/status')
      .then(res => setEstado(res.data))
      .catch(err => console.error('Error al obtener estado de conexión:', err));
  }, []);

  const iconoEstado = (ok) => {
    return (
      <span className={`me-2 fw-bold ${ok ? 'text-success' : 'text-danger'}`}>
        {ok ? '🟢' : '🔴'}
      </span>
    );
  };

  return (
    <div className="text-center mb-3">
      <h5>Estado de conexión</h5>
      {estado ? (
        <div className="d-flex justify-content-center gap-4">
          <div>
            {iconoEstado(estado.mongo)}
            <FaDatabase className="me-1" />
            MongoDB
          </div>
          <div>
            {iconoEstado(estado.mqtt)}
            <FaWifi className="me-1" />
            MQTT - TLS
          </div>
        </div>
      ) : (
        <div className="d-flex justify-content-center gap-4">
        <div>
          {<span className={`me-2 fw-bold  text-danger`}>
         {'🔴'}
      </span>}
          <FaDatabase className="me-1" />
          MongoDB
        </div>
        <div>
        {<span className={`me-2 fw-bold  text-danger`}>
         {'🔴'}
      </span>}
          <FaWifi className="me-1" />
          MQTT - TLS
        </div>
      </div>
      )}
    </div>
  );
};

export default EstadoConexion;
