import { useEffect, useState } from 'react';
import { fetchAllFlashcards } from '../../api/flashcardService';
import { motion, AnimatePresence } from 'framer-motion';

export const Flashcards = () => {
  const [cards, setCards] = useState([]);
  const [currentIndex, setCurrentIndex] = useState(0);

  useEffect(() => {
    const loadCards = async () => {
      try {
        const data = await fetchAllFlashcards();
        setCards(data);
      } catch (err) {
        console.errr('Error: ', err);
      }
    };
    loadCards();
  }, []);

  const handleNext = () => {
    setCurrentIndex((prev) => (prev + 1) % cards.length);
  };

  return (
    <div className="d-flex justify-content-center align-items-center vh-100 bg-dark text-light">
      <div
        className="card border-0  p-4 rounded-4 text-center d-flex flex-column justify-content-between"
        style={{
          width: '22rem',
          height: '30rem',
          backgroundColor: 'transparent',
          overflow: 'hidden',
        }}
      >
        <AnimatePresence mode="wait">
          <motion.div
            key={cards[currentIndex]?.country}
            className="card-body d-flex justify-content-center align-items-center rounded-4"
            style={{
              backgroundColor: '#0d6efd',
              flexGrow: 1,
            }}
            initial={{ x: 300, opacity: 0 }}
            animate={{ x: 0, opacity: 1 }}
            exit={{ x: -300, opacity: 0 }}
            transition={{ duration: 0.2 }}
          >
            <p className="card-text fs-3 fw-semibold m-0 text-white">
              {cards[currentIndex]?.country}
            </p>
          </motion.div>
        </AnimatePresence>

        <div className="card-footer bg-transparent border-0 mt-3">
          <button className="btn btn-light w-100" onClick={handleNext}>
            Next
          </button>
        </div>
      </div>
    </div>
  );
};
