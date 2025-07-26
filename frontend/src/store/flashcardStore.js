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

  triggerShuffle: false,
  setTriggerShuffle: (value) => set({ triggerShuffle: value }),

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
  },
}));
