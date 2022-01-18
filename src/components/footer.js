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
            <Link className="footer-main-link" to="https://github.com/robertdippolito/robertdippolito.github.io/issues">
              Get in Touch!
            </Link>
          </button>
        </div>
        <div className="footer-main-copyright">
          © {new Date().getFullYear()}, Robert D'Ippolito
        </div>
        <div className="footer-main-links">Link 1</div>
      </div>
    </footer>
  )
}

export default Footer