import { Routes, Route } from 'react-router-dom';
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
    </>
  );
}
