import ReactDOM from 'react-dom/client';
import App from './App.jsx';
import './style.scss';

const setAppHeight = () => {
  const appHeight = window.innerHeight;
  document.documentElement.style.setProperty('--app-height', `${appHeight}px`);
};

setAppHeight();
window.addEventListener('resize', setAppHeight);

ReactDOM.createRoot(document.getElementById('root')).render(<App />);

const skeleton = document.getElementById('skeleton');
if (skeleton) skeleton.remove();
