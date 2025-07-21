import './navbar.css';

export const Navbar = () => {
  return (
    <nav className="navbar navbar-dark px-3">
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
      <button className="btn btn-secondary">Shuffle</button>
    </nav>
  );
};
