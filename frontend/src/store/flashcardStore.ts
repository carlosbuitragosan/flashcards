import { use } from 'react';
import { create } from 'zustand';
import { Flashcard, FlashcardStore } from '@/types';

export const shuffleArray = <T>(arr: T[]): T[] => {
  const copy = [...arr];

  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
};

export const useFlashcardStore = create<FlashcardStore>((set, get) => ({
  cards: [],
  setCards: (newCards) => set({ cards: newCards }),

  continents: [],
  setContinents: (newContinents) => set({ continents: newContinents }),

  selectedContinentId: null,
  setSelectedContinentId: (id) => set({ selectedContinentId: id }),
  clearSelectedContinentId: () => set({ selectedContinentId: null }),

  currentIndex: 0,
  setCurrentIndex: (index) => set({ currentIndex: index }),

  isFlipped: false,
  setIsFlipped: (value) => set({ isFlipped: value }),

  hasShownEndingFocus: false,
  setHasShownEndingFocus: (value) => set({ hasShownEndingFocus: value }),

  disableSlide: false,
  setDisableSlide: (value: boolean) => set({ disableSlide: value }),

  focusCards: [],
  setFocusCards: (newCards) => set({ focusCards: newCards }),

  isFocusMode: false,
  setIsFocusMode: (value: boolean) => set({ isFocusMode: value }),

  // hide burger menu in mobile mode
  hideBurgerMenu: () => {
    const menu = document.getElementById('navbarMenu') as HTMLDivElement | null;
    const toggler = document.querySelector(
      '.navbar-toggler'
    ) as HTMLButtonElement | null;
    if (
      menu &&
      toggler &&
      menu?.classList.contains('collapse') &&
      menu.classList.contains('show')
    ) {
      toggler.click();
    }
  },

  // Shuffle cards
  shuffleCards: () => {
    const { cards } = get();

    set({
      cards: shuffleArray(cards),
      currentIndex: 0,
      isFlipped: false,
      disableSlide: true,
    });
  },

  // Start Focus mode
  startFocusMode: () => {
    const { cards } = get();

    const shuffled = shuffleArray(cards);
    // Take the first 10 cards
    const focusCards = shuffled.slice(0, 10);

    set({
      focusCards,
      isFocusMode: true,
      currentIndex: 0,
    });
  },

  endFocusMode: () => {
    const { hideBurgerMenu } = get();
    hideBurgerMenu();
    set({
      focusCards: [] as Flashcard[],
      isFocusMode: false,
      hasShownEndingFocus: false,
      currentIndex: 0,
    });
  },

  quizDeck: [],
  setQuizDeck: (newDeck) => set({ quizDeck: newDeck }),

  quizIndex: 0,
  setQuizIndex: (value) => set({ quizIndex: value }),

  quizType: null,
  setQuizType: (value) => set({ quizType: value }),
  clearQuizType: () => set({ quizType: null }),

  startQuiz: () => {
    const { focusCards } = get();
    const shuffled = shuffleArray(focusCards);
    set({ quizDeck: shuffled });
  },
}));

// ** LOCAL STORAGE **

type PersistedState = {
  isFocusMode: boolean;
  currentIndex: number;
  selectedContinentId: number | null;
  cards?: Flashcard[];
  focusCards?: Flashcard[];
};

// Restore state from localStorage
const saved = localStorage.getItem('flashcardState');
if (saved) {
  const parsed = JSON.parse(saved) as PersistedState;
  // sets multiple values at once
  useFlashcardStore.setState(parsed);
}

// updates localStorage everytime any piece of the state bellow changes
useFlashcardStore.subscribe((state) => {
  const { isFocusMode, cards, focusCards, currentIndex, selectedContinentId } =
    state;
  const stateToPersist = {
    isFocusMode,
    currentIndex,
    selectedContinentId,
    cards: isFocusMode ? undefined : cards,
    focusCards: isFocusMode ? focusCards : undefined,
  };

  // Save to localStorage
  localStorage.setItem('flashcardState', JSON.stringify(stateToPersist));
});
