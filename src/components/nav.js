import * as React from "react"
import { Link } from "gatsby"
import { StaticImage } from "gatsby-plugin-image"

import "../style/nav.css"

const Nav = () => {
  return (
    <div className="navbar-main">
      <div className="navbar-left">
        <div className="navbar-logo">
          <div className="navbar-logo-img">
            <Link className="navbar-link" to="/">
              RD
            </Link>
          </div>
        </div>
      </div>
      <div className="navbar-right">
        <div className="navbar-home">
          <div className="navbar-heading">
            <Link className="navbar-link" to="/">
              Home
            </Link>
          </div>
        </div>
        <div className="navbar-about">
          <div className="navbar-heading">
            <Link className="navbar-link" to="/about">
              About
            </Link>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Nav
