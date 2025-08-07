import { use } from 'react';
import { create } from 'zustand';

export const shuffleArray = (arr) => {
  const copy = [...arr];

  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
};

export const useFlashcardStore = create((set, get) => ({
  cards: [],
  setCards: (newCards) => set({ cards: newCards }),

  continents: [],
  setContinents: (newContinents) => set({ continents: newContinents }),

  selectedContinentId: null,
  setSelectedContinentId: (id) => set({ selectedContinentId: id }),

  currentIndex: 0,
  setCurrentIndex: (index) => set({ currentIndex: index }),

  isFlipped: false,
  setIsFlipped: (value) => set({ isFlipped: value }),

  hasShownEndingFocus: false,
  setHasShownEndingFocus: (value) => set({ hasShownEndingFocus: value }),

  disableSlide: false,
  setDisableSlide: (value) => set({ disableSlide: value }),

  focusCards: [],
  setFocusCards: (newCards) => set({ focusCards: newCards }),

  focusProgress: {},

  isFocusMode: false,
  setIsFocusMode: (value) => set({ isFocusMode: value }),

  hideBurgerMenu: () => {
    const menu = document.getElementById('navbarMenu');
    if (
      menu?.classList.contains('collapse') &&
      //'show' is only applied when it's a burger menu, so it's safe to run the hide animation below
      menu.classList.contains('show')
    ) {
      document.querySelector('.navbar-toggler')?.click();
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
      focusCards: [],
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

  startQuiz: () => {
    const { focusCards } = get();
    const shuffled = shuffleArray(focusCards);
    set({ quizDeck: shuffled });
  },
}));

// ** LOCAL STORAGE **
// Restore state from localStorage
const saved = localStorage.getItem('flashcardState');
if (saved) {
  // sets multiple values at once
  useFlashcardStore.setState(JSON.parse(saved));
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
