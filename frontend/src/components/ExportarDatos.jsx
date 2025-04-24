import React, { useState } from 'react';
import axios from 'axios';
import { saveAs } from 'file-saver';
import Papa from 'papaparse';
import { FaFileCsv, FaCalendarAlt } from 'react-icons/fa';

const ExportarDatos = () => {
  const [fecha, setFecha] = useState('');
  const [exportando, setExportando] = useState(false);

  const exportarCSV = async () => {
    if (!fecha) {
      alert('Por favor selecciona una fecha y hora');
      return;
    }

    setExportando(true);

    try {
      const res = await axios.get(`http://localhost:3000/api/datos/desde?fecha=${fecha}`);
      const datos = res.data;

      if (!Array.isArray(datos) || datos.length === 0) {
        alert('No hay datos para exportar desde esa fecha');
        return;
      }

      const csv = Papa.unparse(
        datos.map(d => ({
          Timestamp: new Date(d.timestamp).toLocaleString(),
          Ruido_dB: d.ruido,
          Tópico: d.topic,
        }))
      );

      const blob = new Blob([csv], { type: 'text/csv;charset=utf-8' });
      saveAs(blob, `lecturas_ruido_desde_${fecha}.csv`);
    } catch (error) {
      console.error('❌ Error al exportar CSV:', error);
      alert('Ocurrió un error al exportar los datos');
    } finally {
      setExportando(false);
    }
  };

  return (
    <div className="card shadow mt-4">
      <div className="card-body">
        <h4 className="card-title text-center">Exportar Datos Históricos</h4>
        <div className="d-flex flex-column align-items-center">
          <label htmlFor="fecha" className="form-label">
            <FaCalendarAlt className="me-2" />Seleccionar fecha y hora:
          </label>
          <input
            type="datetime-local"
            id="fecha"
            className="form-control w-auto mb-3"
            value={fecha}
            onChange={e => setFecha(e.target.value)}
          />
          <button
            className="btn btn-success"
            onClick={exportarCSV}
            disabled={exportando}
          >
            <FaFileCsv className="me-2" />
            {exportando ? 'Exportando...' : 'Exportar CSV'}
          </button>
        </div>
      </div>
    </div>
  );
};

export default ExportarDatos;
