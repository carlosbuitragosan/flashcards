import { Slide, ToastContainer } from 'react-toastify';
import { Flashcards } from './components/flashcards/Flashcards';
import { Navbar } from './components/navbar/Navbar';

export default function App() {
  return (
    <>
      <Navbar />
      <Flashcards />
      <ToastContainer
        toastClassName="custom-toast"
        position="bottom-center"
        theme="dark"
        type="success"
        autoClose={3000}
        transition={Slide}
        pauseOnFocusLoss={false}
      />
    </>
  );
}
