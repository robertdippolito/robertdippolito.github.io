import * as React from "react"
import Nav from '../components/nav'

const Layout = ({ location, title, children }) => {
  const rootPath = `${__PATH_PREFIX__}/`
  const isRootPath = location.pathname === rootPath

  return (
    <>
      <Nav />
      <div className="global-wrapper" data-is-root-path={isRootPath}>
        <main>{children}</main>
        <footer>
          © {new Date().getFullYear()}, Robert D'Ippolito
        </footer>
      </div>
    </>
  )
}

export default Layout
