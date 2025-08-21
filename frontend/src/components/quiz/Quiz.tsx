import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useFlashcardStore } from '../../store/flashcardStore';
import { shuffleArray } from '../../store/flashcardStore';
import './quiz.css';
import { Flashcard } from '@/types';

export const Quiz = () => {
  const navigate = useNavigate();
  const {
    quizDeck,
    quizIndex,
    setQuizIndex,
    quizType,
    clearQuizType,
    endFocusMode,
  } = useFlashcardStore();
  // Store the shuffled answer options for the current question
  const [answerOptions, setAnswerOptions] = useState<Flashcard[]>([]);
  // Track the answer the user selected
  const [selectedAnswerId, setSelectedAnswerId] = useState<Flashcard['id'] | null>(null);

  // Current quiz card, based on current index
  const currentCard = quizDeck[quizIndex];
      
  // Redirect if quiz deck is empty
  useEffect(() => {
    if (quizDeck.length === 0) navigate('/');
  }, [quizDeck]);

  // When the current card changes, generate new answer options
  useEffect(() => {
    if (!currentCard) return;

    // Get 3 incorrect options
    const incorrectOptions = shuffleArray(quizDeck)
      .filter((c) => c !== currentCard)
      .slice(0, 3);

    // Combine correct card with incorrect opotions
    const allOptions = shuffleArray([currentCard, ...incorrectOptions]);

    // Set the answer options and reset selected answer
    setAnswerOptions(allOptions);
    setSelectedAnswerId(null);
  }, [currentCard]);

  const handleClick = (cardId: Flashcard['id']) => {
    // Track the selected answer
    setSelectedAnswerId(cardId);
    setTimeout(() => {
      // End quiz after 4 questions
      if (quizIndex === 3) {
        // Reset quiz related state
        endFocusMode();
        navigate('/');
        // Reset index for future quizzes
        setQuizIndex(0);
        clearQuizType();
      } else {
        // Proceed to next question
        setQuizIndex(quizIndex + 1);
      }
    }, 1000);
  };

  return (
    <div className="d-flex justify-content-center align-items-center full-height bg-dark text-light mt-3">
      <div className="quiz-wrapper position-relative d-flex flex-column justify-content-between ">
        <div className="quiz-container position-absolute w-100 h-100 d-flex flex-column justify-content-center ">
          <small className="quiz-question">
            {quizType === 'capitals'
              ? 'What is the capital of: '
              : quizType === 'countries'
                ? 'Which country has this capital: '
                : quizType === 'flags'
                  ? 'Identify the flag'
                  : ''}
          </small>

          {quizType === 'capitals' ? (
            <p className="mb-5">{currentCard?.country}</p>
          ) : quizType === 'countries' ? (
            <p className="mb-5">{currentCard?.capital}</p>
          ) : quizType === 'flags' ? (
            <img
              src={`/flags/${currentCard.code.toLowerCase()}.svg`}
              onError={(e) => {
                const img = e.currentTarget
                img.onerror = null;
                img.src = currentCard?.flag;
              }}
              className="quiz-flag"
              alt={currentCard?.flag_alt}
            />
          ) : (
            ''
          )}

          <div className="d-flex flex-column gap-4">
            {answerOptions.map((card) => (
              <button
                key={card.id}
                className={`quiz-answer-btn btn ${
                  selectedAnswerId === null // No answer selected yet
                    ? 'btn-dark'
                    : card.id === currentCard.id // Correct answer
                      ? 'btn-success'
                      : card.id === selectedAnswerId // wrong answer
                        ? 'btn-danger'
                        : 'btn-dark'
                } w-100`}
                onClick={() => handleClick(card.id)}
              >
                {quizType == 'capitals'
                  ? card.capital
                  : quizType === 'countries'
                    ? card.country
                    : quizType === 'flags'
                      ? card.country
                      : ''}
              </button>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};
