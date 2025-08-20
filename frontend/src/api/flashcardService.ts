import axios from 'axios';
import { Flashcard, Continent } from '../types';

// Get all flashcards
export const fetchAllFlashcards = async (): Promise<Flashcard[]> => {
  try {
    const { data } = await axios.get<Flashcard[]>('/api/flashcards');
    return data;
  } catch (error) {
    console.error('Error fetching all cards: ', error);
    throw error;
  }
};

// Get all continents
export const fetchAllContinents = async (): Promise<Continent[]> => {
  try {
    const { data } = await axios.get<Continent[]>('/api/decks');
    return data;
  } catch (error) {
    console.error('Error fetching continents: ', error);
    throw error;
  }
};

export const fetchCardsById = async (
  id: Continent['id']
): Promise<Flashcard[]> => {
  try {
    const { data } = await axios.get<Flashcard[]>(
      `/api/decks/${id}/flashcards`
    );
    return data;
  } catch (err) {
    console.error('Error fetching cards by continent: ', err);
    throw err;
  }
};
