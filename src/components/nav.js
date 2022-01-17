import * as React from "react"
import "../style/nav.css"

const Nav = () => {
  return (
    <div className="navbar-main">
      <div className="navbar-left">
        <div className="navbar-logo">
          <div className="navbar-heading">RD</div>
        </div>
      </div>
      <div className="navbar-right">
        <div className="navbar-home">
          <div className="navbar-heading">Home</div>
        </div>
        <div className="navbar-about">
          <div className="navbar-heading">About</div>
        </div>
      </div>
    </div>
  )
}

export default Nav
