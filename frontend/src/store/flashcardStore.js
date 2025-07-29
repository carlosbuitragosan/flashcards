import { create } from 'zustand';

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

  disableSlide: false,
  setDisableSlide: (value) => set({ disableSlide: value }),

  focusCards: [],
  setFocusCards: (newCards) => set({ focusCards: newCards }),

  focusProgress: {},

  isFocusMode: false,
  setIsFocusMode: (value) => set({ isFocusMode: value }),

  shuffleCards: () => {
    const { cards } = get();
    const shuffled = [...cards];

    //shuffle the array
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    set({
      cards: shuffled,
      currentIndex: 0,
      isFlipped: false,
      disableSlide: true,
    });
  },

  startFocusMode: () => {
    const { cards } = get();
    const shuffled = [...cards];

    //shuffle the array
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }

    // Take the first 10 cards
    const focusCards = shuffled.slice(0, 10);

    set({
      focusCards,
      isFocusMode: true,
      currentIndex: 0,
    });
  },
}));
