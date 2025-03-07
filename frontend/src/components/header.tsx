/* eslint-disable prettier/prettier */
import { useState, useEffect } from "react";

import Crucero from "/crucero.png";
import Logo from "/logo/Logo 1.png";
import "../styles/header.css";

export const Header = () => {
  const [isScrolled, setIsScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 300) {
        setIsScrolled(true);
      } else {
        setIsScrolled(false);
      }
    };

    window.addEventListener("scroll", handleScroll);

    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  return (
    <div className="App">
      <header className={`header ${isScrolled ? "hide" : ""}`}>
        <div className="header-overlay">
          <img alt="Logo" className={`logo`} src={Logo} />
        </div>
        <img alt="Crucero" className="crucero" src={Crucero} />
      </header>
    </div>
  );
};
