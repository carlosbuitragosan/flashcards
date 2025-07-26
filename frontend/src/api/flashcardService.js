import axios from 'axios';

// Get all flashcards
export const fetchAllFlashcards = async () => {
  try {
    const response = await axios.get('/api/flashcards');
    return response.data;
  } catch (error) {
    console.error('Error fetching all cards: ', error);
    throw error;
  }
};

// Get all continents
export const fetchAllContinents = async () => {
  try {
    const response = await axios.get('/api/decks');
    return response.data;
  } catch (error) {
    console.error('Error fetching continents: ', error);
    throw error;
  }
};
