import * as React from "react"
import Nav from '../components/nav'

const Layout = ({ location, title, children }) => {
  const rootPath = `${__PATH_PREFIX__}/`
  const isRootPath = location.pathname === rootPath

  return (
    <div className="blog-background">
      <div className="global-wrapper" data-is-root-path={isRootPath}>
        <Nav />
        <main>{children}</main>
        <footer className="blog-main-post-footer">
          © {new Date().getFullYear()}, Robert D'Ippolito
        </footer>
      </div>
    </div>
  )
}

export default Layout
