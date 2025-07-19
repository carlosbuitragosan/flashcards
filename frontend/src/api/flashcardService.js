import axios from 'axios';

// Get a random card
export const fetchAllFlashcards = async () => {
  try {
    const response = await axios.get('/api/flashcards');
    return response.data;
  } catch (error) {
    console.error('Error fetching random  card: ', err);
    throw error;
  }
};
