import { useEffect } from 'react';
import { useFlashcardStore } from '../../store/flashcardStore';
import './navbar.css';

export const Navbar = () => {
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

  const handleShuffle = () => {
    shuffleCards();
    hideBurgerMenu();
  };

  const onSelectContinent = (id) => {
    setSelectedContinentId(id);
    setCurrentIndex(0);
    //In cases where currentIndex is already 0 (same index)
    setIsFlipped(false);
    hideBurgerMenu();
  };

  // collapses the continent dropdown when the main menu collapses
  // useEffect(() => {
  //   const navbarMenu = document.getElementById('navbarMenu');
  //   const continentMenu = document.getElementById('continentMenu');

  //   const onNavbarHidden = () => {
  //     continentMenu?.classList.remove('show');
  //   };

  //   navbarMenu?.addEventListener('hidden.bs.collapse', onNavbarHidden);

  //   return () => {
  //     navbarMenu?.removeEventListener('hidden.bs.collapse', onNavbarHidden);
  //   };
  // });

  return (
    <nav className="navbar navbar-expand-md navbar-dark px-3 mt-2 align-items-start">
      <div className="nav-brand d-flex align-items-center gap-3">
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
        <ul className="navbar-nav ms-md-auto d-flex align-items-center gap-3">
          <li className="nav-item dropdown">
            {/* Toggler for continent dropdown */}
            <a
              className="link-groupBy nav-link dropdown-toggle text-white pointer"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              GROUP BY
            </a>
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
            <button
              className="btn btn-secondary"
              onClick={handleShuffle}
              disabled={cards.length === 0 || disableSlide || isFocusMode}
            >
              SHUFFLE
            </button>
          </li>
          <li className="nav-item">
            <button
              className="btn btn-secondary"
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
        </ul>
      </div>
    </nav>
  );
};
