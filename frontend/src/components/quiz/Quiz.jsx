import { useRef } from 'react';
import { useFlashcardStore } from '../../store/flashcardStore';
import { shuffleArray } from '../../store/flashcardStore';
import './quiz.css';

export const Quiz = () => {
  const { focusCards } = useFlashcardStore();
  // UseRef creates an object that persists across renders
  const shuffledRef = useRef(shuffleArray(focusCards));
  const indexRef = useRef(0);

  const getNewCard = () => {
    const card = shuffledRef.current[indexRef.current];
    indexRef.current++;

    if (indexRef.current >= shuffledRef.current.length) {
      shuffledRef.current = shuffleArray(focusCards);
      indexRef.current = 0;
    }

    return card;
  };

  const targetCard = getNewCard();

  const incorrectOptions = shuffleArray(focusCards)
    .filter((card) => card !== targetCard)
    .slice(0, 3);

  const answerChoices = shuffleArray([targetCard, ...incorrectOptions]);

  return (
    <div className="d-flex justify-content-center align-items-center full-height bg-dark text-light mt-3">
      <div className="quiz-wrapper position-relative d-flex flex-column justify-content-between ">
        <div className="quiz-container position-absolute w-100 h-100 d-flex flex-column justify-content-center ">
          <small>The capital of</small>
          <p className="mb-5">{targetCard.country} is:</p>
          <div className="d-flex flex-column gap-4">
            {answerChoices.map((card) => (
              <button
                key={card.id}
                className="quiz-answer-btn btn btn-secondary w-100"
              >
                {card.capital}
              </button>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};
