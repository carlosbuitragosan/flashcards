import { useFlashcardStore } from '../../store/flashcardStore';

export const Quiz = () => {
  const { focusCards, isFocusMode } = useFlashcardStore();

  console.log('focus cards: ', focusCards);
  console.log('is focus mode: ', isFocusMode);

  return <></>;
};
