import React from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/logo-fiuba.png';

const Navbar = () => (
  <nav className="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
    <div className="container-fluid">
      <Link className="navbar-brand d-flex align-items-center" to="/">
        <img src={logo} alt="FIUBA" height="40" className="me-2" />
        Sistema IoT - FIUBA
      </Link>
      <div>
        <ul className="navbar-nav ms-auto">
          <li className="nav-item">
            <Link className="nav-link" to="/">Dashboard</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/ultimas">Últimas Lecturas</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/historial">Historial</Link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
);

export default Navbar;