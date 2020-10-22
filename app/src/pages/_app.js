import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route } from 'react-router-dom'
import '../styles/index.css';
import Home from './index';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render((
    <BrowserRouter>
      <Route exact path="/" component={Home} />
    </BrowserRouter>
  ), document.getElementById('root'));
})