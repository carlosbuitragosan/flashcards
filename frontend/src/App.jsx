import React, { useEffect, useState } from 'react';

export default function App() {
  const [country, setCountry] = useState(null);

  useEffect(() => {
    fetch('/api/random-card')
    .then((res) => res.json())
    .then((data) => {
      setCountry(data.country);
    })
    .catch((err) => console.error('Error fetching flashcard: ', err));
  }, []);

  return (
    <div>
      <h1>{country ? country : 'Loading...'}</h1>
    </div>
  )
}