import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import App from './App';

const setAppHeight = () => {
  const appHeight = window.innerHeight;
  document.documentElement.style.setProperty('--app-height', `${appHeight}px`);
};

setAppHeight();
window.addEventListener('resize', setAppHeight);

const root = document.getElementById('root');
if (root) {
  ReactDOM.createRoot(root).render(
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
}

// Remove skeleton once the app is loaded
const skeleton = document.getElementById('skeleton');
if (skeleton) skeleton.remove();
