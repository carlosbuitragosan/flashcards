import { ToastContainer } from 'react-toastify';
import { Flashcards } from './components/flashcards/Flashcards';
import { Navbar } from './components/navbar/Navbar';

export default function App() {
  return (
    <>
      <Navbar />
      <Flashcards />
      <ToastContainer
        toastClassName="custom-toast"
        position="top-center"
        theme="dark"
        autoClose={3000}
      />
    </>
  );
}
