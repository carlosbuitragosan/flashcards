export interface Flashcard {
  id: number;
  country: string;
  code: string;
  capital: string;
  deck_id: number;
  flag: string;
  flag_alt: string;
  created_at: string;
  updated_at: string;
}

export interface Continent {
  id: number;
  continent: string;
  created_at: string;
  updated_at: string;
}

export type QuizType = 'capitals' | 'countries' | 'flags';

export interface FlashcardStore {
  cards: Flashcard[];
  setCards: (newCards: Flashcard[]) => void;

  continents: Continent[];
  setContinents: (newContinents: Continent[]) => void;

  selectedContinentId: Continent['id'] | null;
  setSelectedContinentId: (id: Continent['id'] | null) => void;
  clearSelectedContinentId: () => void;

  currentIndex: number;
  setCurrentIndex: (index: number) => void;

  isFlipped: boolean;
  setIsFlipped: (value: boolean) => void;

  hasShownEndingFocus: boolean;
  setHasShownEndingFocus: (value: boolean) => void;

  disableSlide: boolean;
  setDisableSlide: (value: boolean) => void;

  focusCards: Flashcard[];
  setFocusCards: (newCards: Flashcard[]) => void;

  isFocusMode: boolean;
  setIsFocusMode: (value: boolean) => void;

  pendingLookupId: Flashcard['id'] | null;
  setPendingLookupId: (id: Flashcard['id'] | null) => void;

  hideBurgerMenu: () => void;
  shuffleCards: () => void;
  startFocusMode: () => void;
  endFocusMode: () => void;

  quizDeck: Flashcard[];
  setQuizDeck: (newDeck: Flashcard[]) => void;

  quizIndex: number;
  setQuizIndex: (value: number) => void;

  quizType: QuizType | null;
  setQuizType: (value: QuizType | null) => void;
  clearQuizType: () => void;

  startQuiz: () => void;
}
