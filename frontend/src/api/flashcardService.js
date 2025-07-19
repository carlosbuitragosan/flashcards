import axios from "axios";

// Get a random card
export const fetchRandomCard = async () => {

  try {
    const response = await axios.get('/api/random-card')
    return response.data
  } catch (error) {
    console.error('Error fetching random  card: ', err)
    throw error
  }
}