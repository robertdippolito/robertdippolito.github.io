import * as React from "react"
import { Link } from "gatsby"

import "../style/footer.css"

const Footer = () => {
  return (
    <footer className="footer-main">
      <div className="footer-main-container">
        <div className="footer-main-contact">
          Reach out to me to collaborate!
        </div>
        <div className="footer-main-button">
          <button className="footer-main-button-detail">
            <Link
              className="footer-main-button-link"
              to="https://github.com/robertdippolito/robertdippolito.github.io/issues"
            >
              Get in Touch!
            </Link>
          </button>
        </div>
        <div className="footer-main-copyright">
          © {new Date().getFullYear()}, Robert D'Ippolito
        </div>
        <div className="footer-main-links">
          <span>
            <a
              href="https://github.com/robertdippolito"
              aria-label="Visit GitHub profile"
              title="Visit GitHub profile"
              target="_blank"
              rel="noopener noreferrer"
            >
              <svg
                aria-hidden="true"
                className="footer-main-links-github"
                fill="currentColor"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 30 30"
              >
                <path d="M14.988 2.235C7.743 2.232 1.875 8.098 1.875 15.337c0 5.724 3.67 10.59 8.783 12.378.689.173.583-.317.583-.65v-2.271c-3.975.466-4.137-2.165-4.403-2.605-.54-.92-1.814-1.154-1.433-1.593.906-.466 1.828.117 2.898 1.696.773 1.145 2.282.952 3.047.762a3.695 3.695 0 011.016-1.781c-4.119-.739-5.836-3.253-5.836-6.24 0-1.451.478-2.784 1.415-3.86-.597-1.772.056-3.29.144-3.515 1.702-.152 3.471 1.219 3.61 1.327.966-.26 2.07-.398 3.307-.398 1.242 0 2.35.143 3.325.407.331-.252 1.972-1.43 3.554-1.286.085.226.723 1.708.16 3.457.95 1.078 1.433 2.423 1.433 3.876 0 2.994-1.728 5.51-5.859 6.237a3.733 3.733 0 011.116 2.666v3.296c.024.264 0 .525.44.525 5.188-1.75 8.924-6.65 8.924-12.425 0-7.242-5.872-13.105-13.11-13.105z" />
              </svg>
            </a>
          </span>
          <span>
            <a
              href="https://www.linkedin.com/in/robertdippolito/"
              aria-label="Visit LinkedIn profile"
              title="Visit LinkedIn profile"
              target="_blank"
              rel="noopener noreferrer"
            >
              <svg
                aria-hidden="true"
                className="footer-main-links-linkedin"
                fill="currentColor"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 32 32"
              >
                <path d="M27.5 3.5h-23c-.553 0-1 .447-1 1v23c0 .553.447 1 1 1h23c.553 0 1-.447 1-1v-23c0-.553-.447-1-1-1zM10.916 24.803h-3.71V12.872h3.71v11.931zM9.062 11.241a2.15 2.15 0 110-4.301 2.15 2.15 0 010 4.3zm15.741 13.562h-3.706V19c0-1.384-.025-3.162-1.928-3.162-1.928 0-2.225 1.506-2.225 3.062v5.903H13.24V12.872h3.556v1.631h.05c.494-.937 1.703-1.928 3.51-1.928 3.756 0 4.446 2.472 4.446 5.684v6.544z" />
              </svg>
            </a>
          </span>
        </div>
      </div>
    </footer>
  )
}

export default Footer
