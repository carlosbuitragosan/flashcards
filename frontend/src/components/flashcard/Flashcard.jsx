import { useEffect, useState } from 'react';
import { fetchRandomCard } from '../../api/flashcardService';

export const Flashcard = () => {
  const [country, setCountry] = useState(null);

  useEffect(() => {
    const getCard = async () => {
      try {
        const data = await fetchRandomCard();
        setCountry(data.country);
      } catch (err) {
        console.errr('Error: ', err);
      }
    };
    getCard();
  }, []);

  return (
    <div className="d-flex justify-content-center align-items-center vh-100 bg-dark text-light">
      <div
        className="card bg-secondary text-white border-0 shadow p-4 rounded-4 text-center"
        style={{
          width: '22rem',
          height: '30rem',
          transition: 'transform 0.2s ease-in-out',
          cursor: 'pointer',
        }}
        onMouseEnter={(e) => (e.currentTarget.style.transform = 'scale(1.03)')}
        onMouseLeave={(e) => (e.currentTarget.style.transform = 'scale(1)')}
      >
        <div className="card-body d-flex justify-content-center align-items-center">
          <p className="card-text fs-3 fw-semibold">{country}</p>
        </div>
      </div>
    </div>
  );
};
