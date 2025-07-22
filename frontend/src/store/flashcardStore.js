import { create } from 'zustand';

export const useFlashcardStore = create((set, get) => ({
  cards: [],
  setCards: (newCards) => set({ cards: newCards }),

  currentIndex: 0,
  setCurrentIndex: (index) => set({ currentIndex: index }),

  isFlipped: false,
  setIsFlipped: (value) => set({ isFlipped: value }),

  disableSlide: false,
  setDisableSlide: (value) => set({ disableSlide: value }),

  shuffleCards: () => {
    const { cards } = get();
    const shuffled = [...cards];
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
    setTimeout(() => {
      set({ disableSlide: false });
    }, 2000);
  },
}));
