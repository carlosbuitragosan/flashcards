import { Routes, Route } from 'react-router-dom';
import { Slide, ToastContainer } from 'react-toastify';
import { Flashcards } from './components/flashcards/Flashcards';
import { Navbar } from './components/navbar/Navbar';
import { Quiz } from './components/quiz/Quiz';

export default function App() {
  return (
    <>
      <Navbar />
      <Routes>
        <Route path="/" element={<Flashcards />} />
        <Route path="/quiz" element={<Quiz />} />
      </Routes>
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
