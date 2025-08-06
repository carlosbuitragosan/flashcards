import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useFlashcardStore } from '../../store/flashcardStore';
import { shuffleArray } from '../../store/flashcardStore';
import './quiz.css';

export const Quiz = () => {
  const navigate = useNavigate();
  const { quizDeck, quizIndex, setQuizIndex, endFocusMode } =
    useFlashcardStore();
  const [answerOptions, setAnswerOptions] = useState([]);
  const [selectedAnswerId, setSelectedAnswerId] = useState(null);

  const currentCard = quizDeck[quizIndex];

  useEffect(() => {
    if (!currentCard) return;

    const incorrectOptions = shuffleArray(quizDeck)
      .filter((c) => c !== currentCard)
      .slice(0, 3);

    const allOptions = shuffleArray([currentCard, ...incorrectOptions]);
    setAnswerOptions(allOptions);
    setSelectedAnswerId(null);
  }, [currentCard]);

  const handleClick = (cardId) => {
    setSelectedAnswerId(cardId);
    setTimeout(() => {
      if (quizIndex === 2) {
        endFocusMode();
        navigate('/');
        setQuizIndex(0);
      } else {
        setQuizIndex(quizIndex + 1);
      }
    }, 1400);
  };

  console.log('current card: ', currentCard.country);
  console.log('quiz deck: ', quizDeck);
  console.log('quiz Index: ', quizIndex);
  return (
    <div className="d-flex justify-content-center align-items-center full-height bg-dark text-light mt-3">
      <div className="quiz-wrapper position-relative d-flex flex-column justify-content-between ">
        <div className="quiz-container position-absolute w-100 h-100 d-flex flex-column justify-content-center ">
          <small>The capital of</small>
          <p className="mb-5">
            {currentCard?.country}
            <small> is:</small>
          </p>
          <div className="d-flex flex-column gap-4">
            {answerOptions.map((card) => (
              <button
                key={card.id}
                className={`quiz-answer-btn btn ${
                  selectedAnswerId === null
                    ? 'btn-dark'
                    : card.id === currentCard.id
                      ? 'btn-success'
                      : card.id === selectedAnswerId
                        ? 'btn-danger'
                        : 'btn-dark'
                } w-100`}
                onClick={() => handleClick(card.id)}
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
