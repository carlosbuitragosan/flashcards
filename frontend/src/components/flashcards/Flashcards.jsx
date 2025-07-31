import { useEffect, useState } from 'react';
import { useSwipeable } from 'react-swipeable';
import { toast } from 'react-toastify';
import Confetti from 'react-confetti';
import { motion, AnimatePresence } from 'framer-motion';
import { useFlashcardStore } from '../../store/flashcardStore';
import {
  fetchAllFlashcards,
  fetchAllContinents,
  fetchCardsById,
} from '../../api/flashcardService';
import './flashcards.css';

export const Flashcards = () => {
  // Detect touch capability
  const isTouchDevice =
    'ontouchstart' in window || navigator.maxTouchPoints > 0;
  const [showConfetti, setShowConfetti] = useState(false);
  const {
    cards,
    setCards,
    continents,
    setContinents,
    selectedContinentId,
    setSelectedContinentId,
    currentIndex,
    setCurrentIndex,
    isFlipped,
    setIsFlipped,
    disableSlide,
    setDisableSlide,
    focusCards,
    setFocusCards,
    isFocusMode,
    setIsFocusMode,
    startFocusMode,
    endFocusMode,
  } = useFlashcardStore();

  // displays cards conditionally
  const activeCards = isFocusMode ? focusCards : cards;

  // runs once on component mount
  useEffect(() => {
    const init = async () => {
      try {
        const continentData = await fetchAllContinents();
        setContinents(continentData);

        const continentId = useFlashcardStore.getState().selectedContinentId;

        // This triggers the second useEffect below
        if (continentId === null) {
          setSelectedContinentId(null);
        }
      } catch (err) {
        console.error('Error Loading continents: ', err);
      }
    };
    init();
  }, []);

  useEffect(() => {
    // Reset card to its front face
    setIsFlipped(false);
  }, [currentIndex]); // <- runs when card changes

  // Runs every time a continent is selected
  useEffect(() => {
    const loadCards = async () => {
      try {
        const continentId = useFlashcardStore.getState().selectedContinentId;

        // Fetch all cards if id=null else fetch cards by id
        const newCards =
          continentId === null
            ? await fetchAllFlashcards()
            : await fetchCardsById(continentId);

        // Save to the store
        setCards(newCards);
      } catch (err) {
        console.error('Error loading cards: ', err);
      }
    };
    loadCards();
  }, [selectedContinentId]);

  useEffect(() => {
    // Reset card to its front face
    setIsFlipped(false);
  }, [currentIndex]); // <- runs when card changes

  // Action for next card
  const handleNext = () => {
    // End session in focus mode
    if (isFocusMode && currentIndex === focusCards.length - 1) {
      // renders cards array with current setting
      setIsFocusMode(false);
      // empty focus cards array and reset current index
      (setFocusCards([]), setCurrentIndex(0));
      toast('Focus session complete!');
      setShowConfetti(true);
      setTimeout(() => setShowConfetti(false), 8000);
      return;
    }
    // Show next card in focus mode
    if (isFocusMode) {
      setCurrentIndex(currentIndex + 1);
    }
    // ** Normal mode **
    // calculate next index; loops back to 0
    const nextIndex = (currentIndex + 1) % cards.length;
    // update current index to show next card
    setCurrentIndex(nextIndex);
  };

  const handlers = useSwipeable({
    onSwipedLeft: () => handleNext(),
    preventScrollOnSwipe: true,
    trackTouch: true,
  });

  // Starts focus mode with 10 random cards from deck
  const startFocus = () => {
    startFocusMode();
  };

  return (
    <>
      <div className="flashcard-content d-flex justify-content-center align-items-center full-height bg-dark text-light">
        <div className="card-wrapper d-flex flex-column justify-content-between align-items-center">
          <AnimatePresence mode="wait">
            <motion.div
              // triggers animations when card changes
              key={activeCards[currentIndex]?.country}
              className="flip-card-container w-100 h-100"
              // slide in when disableSlide is false ()
              initial={disableSlide ? {} : { x: 300, opacity: 0 }}
              animate={
                disableSlide
                  ? { rotateY: [0, 360 * 5] } // <- shuffle animation full spin
                  : { x: 0, opacity: 1 } // <- normal card slide-in animation
              }
              //  slide out
              exit={disableSlide ? {} : { x: -300, opacity: 0 }}
              transition={{
                duration: disableSlide ? 2 : 0.2,
                ease: 'easeInOut',
              }}
              onAnimationComplete={() => {
                if (disableSlide) {
                  setDisableSlide(false);
                }
              }}
            >
              {/* this wrapper preserves 3d space and controls rotation */}
              <div
                className="flip-card w-100 h-100"
                onClick={() => setIsFlipped(!isFlipped)}
                style={{
                  transform: isFlipped ? 'rotateY(180deg)' : 'rotateY(0deg)',
                }}
                {...handlers} // <- enables swipe gestures
              >
                {/* FRONT */}
                {/* .card-face has backface-visibility: hidden so only this side is visible */}
                <div className="card-face front position-absolute w-100 h-100 d-flex justify-content-center align-items-center">
                  <small className="label position-absolute">Country</small>

                  <small className="deck-label position-absolute">
                    {activeCards[currentIndex]?.deck_id === selectedContinentId
                      ? continents.find(
                          (cont) => cont.id === selectedContinentId
                        )?.continent
                      : ''}
                  </small>

                  <p className="card-name">
                    {activeCards[currentIndex]?.country}
                  </p>
                </div>

                {/* BACK */}
                <div className="card-face back w-100 h-100 d-flex justify-content-center align-items-center">
                  <small className="label position-absolute">Capital</small>

                  <p className="card-name">
                    {activeCards[currentIndex]?.capital}
                  </p>

                  <img
                    src={activeCards[currentIndex]?.flag}
                    className="flag-label position-absolute"
                    alt={activeCards[currentIndex]?.flag_alt}
                  />
                </div>
              </div>
            </motion.div>
          </AnimatePresence>

          <div className="card-footer mt-3 w-100">
            {!isTouchDevice && (
              <button
                className="btn btn-secondary w-100"
                onClick={handleNext}
                // disable if cards are loading or animation is happening
                disabled={activeCards.length === 0 || disableSlide}
              >
                NEXT
              </button>
            )}
          </div>
        </div>
      </div>

      {/* Focus Modal */}
      <div
        className="modal fade"
        id="focusModal"
        tabIndex="-1"
        aria-labelledby="focusModalLabel"
        aria-hidden="true"
      >
        <div className="modal-dialog modal-dialog-centered">
          <div className="modal-content bg-dark text-light">
            <div className="modal-header">
              <h5 className="modal-title" id="focusModalLabel">
                Focus Mode
              </h5>
              <button
                type="button"
                className="btn-close btn-close-white"
                data-bs-dismiss="modal"
                aria-label="close"
              ></button>
            </div>
            <div className="modal-body">
              <p>Cards: 10</p>
              <p>
                Region:{' '}
                {selectedContinentId === null
                  ? 'All'
                  : continents.find((c) => c.id === selectedContinentId)
                      ?.continent}
              </p>
            </div>
            <div className="modal-footer">
              <button className="btn btn-secondary" data-bs-dismiss="modal">
                Cancel
              </button>
              <button
                className="btn btn-secondary"
                data-bs-dismiss="modal"
                onClick={startFocus}
              >
                Start
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Display confetti */}
      {showConfetti && (
        <Confetti
          numberOfPieces={800}
          initialVelocityY={-15}
          gravity={0.1}
          recycle={false}
        />
      )}
    </>
  );
};
