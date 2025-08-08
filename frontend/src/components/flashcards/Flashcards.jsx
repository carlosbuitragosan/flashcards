import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useSwipeable } from 'react-swipeable';
import Confetti from 'react-confetti-boom';
import { Modal } from 'bootstrap/dist/js/bootstrap.bundle.min';
import { motion, AnimatePresence } from 'framer-motion';
import { useFlashcardStore } from '../../store/flashcardStore';
import {
  fetchAllFlashcards,
  fetchAllContinents,
  fetchCardsById,
} from '../../api/flashcardService';
import './flashcards.css';

export const Flashcards = () => {
  const [isLoading, setIsloading] = useState(true);
  const navigate = useNavigate();

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
    hasShownEndingFocus,
    setHasShownEndingFocus,
    disableSlide,
    setDisableSlide,
    focusCards,
    isFocusMode,
    endFocusMode,
    startFocusMode,
    hideBurgerMenu,
    startQuiz,
    setQuizType,
  } = useFlashcardStore();

  // displays cards conditionally
  const activeCards = isFocusMode ? focusCards : cards;

  const showQuizModal = () => {
    const quizModal = new Modal(document.getElementById('quizModal'));
    quizModal.show();
  };

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
        //
        setIsloading(false);
      } catch (err) {
        console.error('Error loading cards: ', err);
      }
    };
    loadCards();
  }, [selectedContinentId]);

  // Reset card to its front face
  useEffect(() => {
    setIsFlipped(false);
  }, [currentIndex]); // <- runs when card changes

  //Show end of focus mode when last card is flipped
  useEffect(() => {
    const isLastCard = currentIndex === activeCards.length - 1;

    if (isFocusMode && isLastCard && isFlipped && !hasShownEndingFocus) {
      setShowConfetti(true);
      setTimeout(() => showQuizModal(), 2000);
      setTimeout(() => setShowConfetti(false), 8000);
      setHasShownEndingFocus(true);
      return;
    }
  }, [isFocusMode, isFlipped, hasShownEndingFocus]);

  // Action for next card
  const handleNext = () => {
    const isLastCard = currentIndex === activeCards.length - 1;

    // Block interaction at end of  focus mode
    if (isFocusMode && isLastCard) return;

    const nextIndex = (currentIndex + 1) % activeCards.length;

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
    hideBurgerMenu();
  };

  const handleStartQuiz = (quizType) => {
    setQuizType(quizType);
    navigate('quiz');
    startQuiz();
  };
  // wait for data to load
  if (isLoading) return null;

  console.log(cards.find((c) => c.country === 'United Kingdom'));
  return (
    <>
      <div className="flashcard-content d-flex justify-content-center align-items-center full-height bg-dark text-light">
        <div className="card-wrapper position-relative d-flex flex-column justify-content-between ">
          {/* show tag for focus mode and No of cards left in session */}
          {isFocusMode && (
            <small className="focus-label position-absolute">
              {'Focus: ' + (activeCards.length - currentIndex)}
            </small>
          )}
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
                  <small className="country-label position-absolute">
                    Country
                  </small>

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
                  <small className="country-label position-absolute">
                    Capital
                  </small>

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
                className="btn btn-styled text-white w-100"
                onClick={handleNext}
                // disable if cards are loading or animation is happening
                disabled={
                  activeCards.length === 0 ||
                  disableSlide ||
                  (isFocusMode && currentIndex === focusCards.length - 1)
                }
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
              <button
                className="btn btn-styled text-white"
                data-bs-dismiss="modal"
                onClick={startFocus}
              >
                START
              </button>
              <button
                className="btn btn-styled text-white"
                data-bs-dismiss="modal"
              >
                CANCEL
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Quiz modal */}
      <div
        className="modal fade"
        id="quizModal"
        tabIndex="-1"
        aria-labelledby="focusModalLabel"
        aria-hidden="true"
      >
        <div className="modal-dialog modal-dialog-centered">
          <div className="modal-content bg-dark text-light">
            <div className="modal-header">
              <h5 className="modal-title">Quiz</h5>
              <button
                type="button"
                className="btn-close btn-close-white"
                data-bs-dismiss="modal"
              ></button>
            </div>
            <div className="modal-body">
              <p>Focus session complete!</p>
              <p>Test your knowledge of: </p>
            </div>
            <div className="quiz-modal-footer modal-footer">
              <button
                className="btn btn-styled text-white flex-fill"
                data-bs-dismiss="modal"
                onClick={() => handleStartQuiz('capitals')}
              >
                CAPITALS
              </button>
              <button
                className="btn btn-styled text-white flex-fill"
                data-bs-dismiss="modal"
                onClick={() => handleStartQuiz('countries')}
              >
                COUNTRIES
              </button>
              <button
                className="btn btn-styled text-white flex-fill"
                data-bs-dismiss="modal"
                onClick={() => handleStartQuiz('flags')}
              >
                FLAGS
              </button>
              <button
                className="btn btn-styled text-white flex-fill"
                data-bs-dismiss="modal"
                onClick={endFocusMode}
              >
                EXIT
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Display confetti */}
      {showConfetti && (
        <Confetti
          mode="boom"
          particleCount={300}
          shapeSize={9}
          colors={[
            '#FF0000',
            '#FF7F00',
            '#FFFF00',
            '#00FF00',
            '#0000FF',
            '#4B0082',
            '#8B00FF',
          ]}
        />
      )}
    </>
  );
};
