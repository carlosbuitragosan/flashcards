import { create } from 'zustand';

export const useFlashcardStore = create((set) => ({
  cards: [],
  setCards: (newCards) => set({ cards: newCards }),

  currentIndex: 0,
  setCurrentIndex: (index) => set({ currentIndex: index }),

  isFliiped: false,
  setIsFlipped: (value) => set({ isFliiped: value }),
}));
