import ReactDOM from 'react-dom/client';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'react-toastify/dist/ReactToastify.css';
import { registerSW } from 'virtual:pwa-register';
import App from './App.jsx';
import './style.scss';

// Registers the PWA service worker based on Vite plugin config
registerSW();

const setAppHeight = () => {
  const appHeight = window.innerHeight;
  document.documentElement.style.setProperty('--app-height', `${appHeight}px`);
};

setAppHeight();
window.addEventListener('resize', setAppHeight);

ReactDOM.createRoot(document.getElementById('root')).render(<App />);

const skeleton = document.getElementById('skeleton');
if (skeleton) skeleton.remove();
