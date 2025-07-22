import React, { useState } from 'react';
import { Flashcards } from './components/flashcards/Flashcards';
import { Navbar } from './components/navbar/Navbar';
import { useFlashcardStore } from './store/flashcardStore';

export default function App() {
  const [triggerShuffle, setTriggerShuffle] = useState(false);
  const { shuffleCards } = useFlashcardStore();

  const handleShuffle = () => {
    shuffleCards();
    setTriggerShuffle(true);
  };

  return (
    <>
      <Navbar onShuffle={handleShuffle} />
      <Flashcards
        triggerShuffle={triggerShuffle}
        setTriggerShuffle={setTriggerShuffle}
      />
    </>
  );
}
