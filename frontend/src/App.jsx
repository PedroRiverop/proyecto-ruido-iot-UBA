import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Dashboard from './pages/Dashboard';
import UltimasLecturas from './pages/UltimasLecturas';
import Historial from './pages/Historial';

function App() {
  return (
    <Router>
      <Navbar />
      <div className="container mt-4">
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/ultimas" element={<UltimasLecturas />} />
          <Route path="/historial" element={<Historial />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
