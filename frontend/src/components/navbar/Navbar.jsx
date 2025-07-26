import { useFlashcardStore } from '../../store/flashcardStore';

import './navbar.css';

export const Navbar = () => {
  const { cards } = useFlashcardStore();
  const { shuffleCards, setTriggerShuffle, disableSlide, continents } =
    useFlashcardStore();

  const handleShuffle = () => {
    shuffleCards();
    setTriggerShuffle(true);
  };
  return (
    <nav className="navbar navbar-expand-md navbar-dark px-3">
      <div className="nav-brand d-flex align-items-center gap-3">
        <img
          className="nav-logo"
          src="/favicon.ico"
          alt="logo"
          width="32"
          height="32"
        />
        <h1 className="nav-title navbar-brand mb-0 h1">Country Flashcards</h1>
      </div>
      {/* Toggler for mobile view */}
      <button
        className="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarMenu"
        aria-controls="navbarMenu"
        aria-expanded="false"
        aria-label="toggle navigation"
      >
        <span className="navbar-toggler-icon"></span>
      </button>

      {/* Collapsable content */}
      <div id="navbarMenu" className="collapse navbar-collapse ">
        <ul className="navbar-nav d-flex align-items-center gap-3">
          <li className="nav-item dropdown">
            {/* Toggler for continent dropdown */}
            <span
              className="nav-link text-white pointer "
              data-bs-toggle="collapse"
              data-bs-target="#continentMenu"
              role="button"
              aria-expanded="false"
              aria-controls="continentMenu"
            >
              Group by
            </span>
            <ul id="continentMenu" className="collapse bg-dark list-unstyled">
              {continents.map((continent) => (
                <li key={continent.id} className="mb-3">
                  <span className="dropdown-item text-center text-white pointer">
                    {continent.continent}
                  </span>
                </li>
              ))}
              <li>Show All</li>
            </ul>
          </li>
          <li className="nav-item">
            <button
              className="btn btn-secondary"
              onClick={handleShuffle}
              disabled={cards.length === 0 || disableSlide}
            >
              Shuffle
            </button>
          </li>
        </ul>
      </div>
    </nav>
  );
};
