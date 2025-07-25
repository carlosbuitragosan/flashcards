import { useEffect, useState } from 'react';
import {
  fetchAllFlashcards,
  fetchAllContinents,
} from '../../api/flashcardService';
import { motion, AnimatePresence } from 'framer-motion';
import { useFlashcardStore } from '../../store/flashcardStore';
import './flashcards.css';

export const Flashcards = () => {
  const {
    cards,
    setCards,
    continents,
    setContinents,
    currentIndex,
    setCurrentIndex,
    isFlipped,
    setIsFlipped,
    disableSlide,
    setDisableSlide,
    triggerShuffle,
    setTriggerShuffle,
  } = useFlashcardStore();

  useEffect(() => {
    const loadCards = async () => {
      try {
        const data = await fetchAllFlashcards();
        setCards(data);
        const continentData = await fetchAllContinents();
        setContinents(continentData);
      } catch (err) {
        console.error('Error: ', err);
      }
    };
    loadCards();
  }, []);

  useEffect(() => {
    setIsFlipped(false);
  }, [currentIndex]);

  const handleNext = () => {
    const nextIndex = (currentIndex + 1) % cards.length;
    setCurrentIndex(nextIndex);
  };

  return (
    <div className="d-flex justify-content-center align-items-center full-height bg-dark text-light">
      <div className="card-wrapper d-flex flex-column justify-content-between align-items-center">
        <AnimatePresence mode="wait">
          <motion.div
            key={cards[currentIndex]?.country}
            className="flip-card-container w-100 h-100"
            initial={disableSlide ? {} : { x: 300, opacity: 0 }}
            animate={
              disableSlide && triggerShuffle
                ? { rotateY: [0, 360 * 5] }
                : disableSlide
                  ? {}
                  : {
                      x: 0,
                      opacity: 1,
                    }
            }
            exit={disableSlide ? {} : { x: -300, opacity: 0 }}
            transition={{
              duration: triggerShuffle ? 2 : 0.2,
              ease: 'easeInOut',
            }}
            onAnimationComplete={() => {
              if (triggerShuffle) {
                setTriggerShuffle(false);
                setDisableSlide(false);
              }
            }}
          >
            <div
              className="flip-card w-100 h-100"
              onClick={() => setIsFlipped(!isFlipped)}
              style={{
                transform: isFlipped ? 'rotateY(180deg)' : 'rotateY(0deg)',
              }}
            >
              {/* FRONT */}
              <div className="card-face front position-absolute w-100 h-100 d-flex justify-content-center align-items-center">
                <small className="label position-absolute">Country</small>
                <p className="card-name">{cards[currentIndex]?.country}</p>
              </div>

              {/* BACK */}
              <div className="card-face back w-100 h-100 d-flex justify-content-center align-items-center">
                <small className="label position-absolute">Capital</small>
                <p className="card-name">{cards[currentIndex]?.capital}</p>
              </div>
            </div>
          </motion.div>
        </AnimatePresence>

        <div className="card-footer mt-3 w-100">
          <button
            className="btn btn-secondary w-100"
            onClick={handleNext}
            disabled={cards.length === 0 || disableSlide}
          >
            Next
          </button>
        </div>
      </div>
    </div>
  );
};
