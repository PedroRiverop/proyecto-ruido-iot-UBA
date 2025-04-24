import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { FaVolumeUp, FaClock, FaExclamationTriangle } from 'react-icons/fa';
import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer
} from 'recharts';
import Modal from 'react-modal';
Modal.setAppElement('#root');

const Dashboard = () => {
  const [lectura, setLectura] = useState(null);
  const [historial, setHistorial] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [umbral, setUmbral] = useState(69);
  const [estadisticas, setEstadisticas] = useState({ max: null, min: null, avg: null });
  const evaluarRuido = (valor) => {
    if (valor >= 69) return { color: 'danger', texto: 'Ruido Alto', icono: '🔴' };
    if (valor >= 61) return { color: 'warning', texto: 'Ruido Moderado', icono: '🟡' };
    return { color: 'success', texto: 'Ruido Bajo', icono: '🟢' };
  };
  



  useEffect(() => {
    axios.get('http://localhost:3000/api/datos/latest')
      .then(res => {
        setLectura(res.data);
        setHistorial([res.data]);  // iniciar historial
      })
      .catch(err => console.error('Error al obtener datos:', err));
  }, []);

  useEffect(() => {
    const eventSource = new EventSource('http://localhost:3000/api/stream');

    eventSource.onmessage = (event) => {
      const nuevoDato = JSON.parse(event.data);
      console.log('📡 Nueva lectura SSE:', nuevoDato);
      setLectura(nuevoDato);
      // Mostrar modal solo si ruido === 69
      if (nuevoDato.ruido >= umbral) {
        setShowModal(true);
      } else {
        setShowModal(false);
      }
      

      setHistorial(prev => {
        const actualizados = [...prev, nuevoDato].slice(-20);

        // Filtrar solo las lecturas de hoy
        const hoy = new Date().toDateString();
        const deHoy = actualizados.filter(l => new Date(l.timestamp).toDateString() === hoy);

        // Calcular estadísticas si hay datos de hoy
        if (deHoy.length > 0) {
            const niveles = deHoy.map(l => l.ruido);
            const max = Math.max(...niveles);
            const min = Math.min(...niveles);
            const avg = Math.round(niveles.reduce((a, b) => a + b, 0) / niveles.length);
            setEstadisticas({ max, min, avg });
        }

  return actualizados;
      });
    };

    eventSource.onerror = (err) => {
      console.error('❌ Error con SSE:', err);
      eventSource.close();
    };

    return () => {
      eventSource.close();
    };
  }, []);

  return (
    <div className="container mt-4">
      <div className="card text-center shadow mb-4">
        <div className="card-body">
          <h3 className="card-title">Última lectura</h3>
          {lectura ? (
            <>
              <p className="display-4"><FaVolumeUp className="me-2 text-primary" /> {lectura.ruido} dB</p>
              <p className="text-muted"><FaClock className="me-2" /> {new Date(lectura.timestamp).toLocaleString()}</p>
              <p><strong>Tópico:</strong> {lectura.topic}</p>
              <div className={`alert alert-${evaluarRuido(lectura.ruido).color} mt-3`} role="alert">
                <strong>{evaluarRuido(lectura.ruido).icono} {evaluarRuido(lectura.ruido).texto}</strong> - Nivel actual: <span className="fw-bold">{lectura.ruido} dB</span>
              </div>

            </>
          ) : (
            <p>Cargando datos...</p>
          )}

          <div className="my-4">
            <label htmlFor="umbralSlider" className="form-label">
                Umbral de alerta: <strong>{umbral} dB</strong>
            </label>
            <input
                type="range"
                className="form-range"
                id="umbralSlider"
                min="50"
                max="90"
                value={umbral}
                onChange={(e) => setUmbral(parseInt(e.target.value))}
            />
            </div>

        </div>

      </div>
        <div>
             {lectura?.ruido === 69 && (
            <Modal
            isOpen={showModal}
            onRequestClose={() => setShowModal(false)}
            contentLabel="Alerta de Ruido Alto"
            className="modal-alert"
            overlayClassName="modal-overlay"
        >
            <div className="text-center">
            <FaExclamationTriangle size={60} className="text-danger mb-3 animate__animated animate__tada" />
            <h2 className="text-danger">¡Ruido Alto Detectado!</h2>
            <p className="fs-4">Nivel de 69 dB</p>
            <p>Este valor podría indicar una situación de ruido anómala. Verifica el entorno.</p>
            </div>
        </Modal>
        )}
        </div>
     


      <div className="card shadow">
        <div className="card-body">
          <h4 className="card-title text-center">Evolución del Nivel de Ruido (últimas 20 lecturas)</h4>

          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={historial}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="timestamp" tickFormatter={(v) => new Date(v).toLocaleTimeString()} />
              <YAxis domain={[55, 75]} />
              <Tooltip labelFormatter={(v) => new Date(v).toLocaleString()} />
              <Line type="monotone" dataKey="ruido" stroke="#007bff" dot />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </div>


      <div className="card shadow mt-4">
        <div className="card-body">
            <h4 className="card-title text-center mb-4">📆 Resumen del Día</h4>
            <div className="row text-center">
            <div className="col-md-4 mb-3 mb-md-0">
                <div className="card bg-light border-0 shadow-sm h-100">
                <div className="card-body">
                    <h5 className="card-title">🔊 Máximo</h5>
                    <p className="fs-4 text-danger">{estadisticas.max ?? '–'} dB</p>
                </div>
                </div>
            </div>
            <div className="col-md-4 mb-3 mb-md-0">
                <div className="card bg-light border-0 shadow-sm h-100">
                <div className="card-body">
                    <h5 className="card-title">🔈 Mínimo</h5>
                    <p className="fs-4 text-success">{estadisticas.min ?? '–'} dB</p>
                </div>
                </div>
            </div>
            <div className="col-md-4">
                <div className="card bg-light border-0 shadow-sm h-100">
                <div className="card-body">
                    <h5 className="card-title">📊 Promedio</h5>
                    <p className="fs-4 text-primary">{estadisticas.avg ?? '–'} dB</p>
                </div>
                </div>
            </div>
            </div>
        </div>
        </div>



    </div>
  );
};

export default Dashboard;
