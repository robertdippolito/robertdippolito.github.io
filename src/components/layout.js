import * as React from "react"
import Nav from "../components/nav"
import Footer from "../components/footer"

const Layout = ({ location, title, children }) => {
  const rootPath = `${__PATH_PREFIX__}/`
  const isRootPath = location.pathname === rootPath

  return (
    <div className="blog-background">
      <div className="global-wrapper" data-is-root-path={isRootPath}>
        <Nav />
        <main>{children}</main>
      </div>
      <Footer />
    </div>
  )
}

export default Layout
