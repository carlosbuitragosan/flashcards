import { useNavigate, useLocation } from 'react-router-dom';
import { useFlashcardStore } from '../../store/flashcardStore';
import { Continent } from '@/types';
import './navbar.css';

export const Navbar = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const isQuizRoute = location.pathname === '/quiz';
  const {
    cards,
    shuffleCards,
    disableSlide,
    continents,
    selectedContinentId,
    setSelectedContinentId,
    isFocusMode,
    endFocusMode,
    hideBurgerMenu,
    setCurrentIndex,
    setIsFlipped,
  } = useFlashcardStore();

  // Home page navigation
  const handleLogoClick = () => {
    if (isQuizRoute) {
      endFocusMode();
    }
    navigate('/');
  };

  // Shuffle cards
  const handleShuffle = () => {
    shuffleCards();
    hideBurgerMenu();
  };

  // Select cards from a specific region
  const onSelectContinent = (id: Continent['id'] | null) => {
    setSelectedContinentId(id);
    setCurrentIndex(0);
    //if currentIndex is already 0, the card needs to be flipped to the front
    setIsFlipped(false);
    hideBurgerMenu();
  };

  const handleExitQuiz = () => {
    navigate('/');
    endFocusMode();
  };

  return (
    <nav className="navbar navbar-expand-md navbar-dark px-3 mt-2 align-items-start">
      <div
        className="nav-brand d-flex align-items-center gap-3"
        onClick={handleLogoClick}
      >
        <img
          className="nav-logo"
          src="/favicon.ico"
          alt="logo"
          width="32"
          height="32"
        />
        <h1 className="nav-title navbar-brand mb-0 h1">COUNTRY FLASHCARDS</h1>
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
      <div id="navbarMenu" className="collapse navbar-collapse bg-dark">
        <ul className="navbar-nav ms-md-auto d-flex align-items-center justify-content-center gap-3">
          <li className="nav-item dropdown">
            {/* Toggler for continent dropdown */}
            {!isQuizRoute && (
              <button
                className="btn btn-styled dropdown-toggle text-white pointer"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                disabled={isFocusMode}
              >
                GROUP BY
              </button>
            )}
            <ul className="dropdown-menu dropdown-menu-dark">
              {continents.map((continent) => (
                <li
                  key={continent.id}
                  className="mb-3"
                  onClick={() => onSelectContinent(continent.id)}
                >
                  <span
                    className={`dropdown-item text-white pointer ${continent.id === selectedContinentId ? 'text-decoration-underline' : ''}`}
                    data-bs-toggle="collapse"
                    data-bs-target="#continentMenu"
                  >
                    {continent.continent}
                  </span>
                </li>
              ))}
              <li onClick={() => onSelectContinent(null)}>
                <span
                  className={`dropdown-item pointer  ${selectedContinentId === null ? 'text-decoration-underline' : ''}`}
                  data-bs-toggle="dropdown"
                  data-bs-target="#continentMenu"
                >
                  Show All
                </span>
              </li>
            </ul>
          </li>

          <li className="nav-item">
            {!isQuizRoute && (
              <button
                className="btn btn-styled text-white"
                onClick={handleShuffle}
                disabled={cards.length === 0 || disableSlide || isFocusMode}
              >
                SHUFFLE
              </button>
            )}
          </li>

          {/* Focus mode button */}
          {!isQuizRoute && (
            <li className="nav-item">
              <button
                className="btn btn-styled text-white"
                // Open modal or exit focus mode
                data-bs-toggle={!isFocusMode ? 'modal' : undefined}
                data-bs-target={!isFocusMode ? '#focusModal' : undefined}
                onClick={isFocusMode ? endFocusMode : undefined}
                disabled={
                  cards.length === 0 ||
                  disableSlide ||
                  continents.find((c) => c.id === selectedContinentId)
                    ?.continent === 'Antarctic'
                }
              >
                {isFocusMode ? 'END FOCUS' : 'FOCUS'}
              </button>
            </li>
          )}

          {/* Exit Quiz button */}
          {isQuizRoute && (
            <li className="nav-item">
              <button
                className="btn btn-styled text-white"
                onClick={handleExitQuiz}
              >
                EXIT QUIZ
              </button>
            </li>
          )}
        </ul>
      </div>
    </nav>
  );
};
