import React from 'react';

import amberLogo from '../images/amberLogo.png';
import reactLogo from '../images/reactLogo.png';
import '../styles/App.css';

import HelloAmber from '../components/HelloAmber';
import HelloReact from '../components/HelloReact';

function Home() {
  return (
    <div className="App">
      <header>
        <img src={amberLogo} id="amber-logo" alt="Amber Logo" />
        <div />
        <img src={reactLogo} id="react-logo" alt="React Logo" />
      </header>
      <div>
        <div>Reactive Amber</div>
        <HelloReact />
        <HelloAmber />
      </div>
    </div>
  );
}

export default Home;
