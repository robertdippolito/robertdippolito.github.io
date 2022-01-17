import * as React from "react"
import { useStaticQuery, graphql } from "gatsby"
import { StaticImage } from "gatsby-plugin-image"
import '../style/bio.css'

const Bio = () => {
  const data = useStaticQuery(graphql`
    query BioQuery {
      site {
        siteMetadata {
          author {
            name
            summary
          }
          social {
            twitter
          }
        }
      }
    }
  `)

  // Set these values by editing "siteMetadata" in gatsby-config.js
  const author = data.site.siteMetadata?.author

  return (
    <div className="bio-main-container">
      <div className="bio-grid-container">
        {author?.name && (
          <div className="bio-grid-title">
            Hi 👋🏻, I'm <strong>{author.name}</strong> {author?.summary || null}
            {` `}
          </div>
        )}
        <StaticImage
          className="bio-grid-img"
          layout="constrained"
          formats={["AUTO", "WEBP", "AVIF"]}
          src="../images/full-rob-2.jpg"
          aspectRatio={1}
          quality={95}
          alt="Profile picture"
        />
      </div>
    </div>
  )
}

export default Bio
