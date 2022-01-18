import * as React from "react"
import { Link, graphql } from "gatsby"
import '../style.css'

import Bio from "../components/bio"
import Layout from "../components/layout"
import Seo from "../components/seo"

const BlogIndex = ({ data, location }) => {
  const siteTitle = data.site.siteMetadata?.title || `Title`
  const posts = data.allMarkdownRemark.nodes

  if (posts.length === 0) {
    return (
      <Layout location={location} title={siteTitle}>
        <Seo title="All posts" />
        <Bio />
        <p>
          No blog posts found. Add markdown posts to "content/blog" (or the
          directory you specified for the "gatsby-source-filesystem" plugin in
          gatsby-config.js).
        </p>
      </Layout>
    )
  }

  return (
    <Layout location={location} title={siteTitle}>
      <Seo title="All posts" />
      <Bio />
      <div className="blog-main-artile-disclaimer-container">
        <div className="blog-main-artile-disclaimer-title">LATEST POSTS</div>
        <div className="blog-main-artile-disclaimer-subtitle">All opinions are my own and not those of my employer.</div>
      </div>
      <ol style={{ listStyle: `none` }}>
        {posts.map(post => {
          const title = post.frontmatter.title || post.fields.slug

          return (
            <Link
              className="blog-main-post-link"
              to={post.fields.slug}
              itemProp="url"
              key={post.fields.slug}
            >
              <li>
                <article
                  className="post-list-item"
                  itemScope
                  itemType="http://schema.org/Article"
                >
                  <header>
                    <div>
                      <span
                        className="blog-main-post-title"
                        itemProp="headline"
                      >
                        {title}
                      </span>
                    </div>
                    <small className="blog-main-post-date">
                      {post.frontmatter.date}
                    </small>
                  </header>
                  <section>
                    <div
                      className="blog-main-post-description"
                      dangerouslySetInnerHTML={{
                        __html: post.frontmatter.description || post.excerpt,
                      }}
                      itemProp="description"
                    />
                  </section>
                </article>
                <hr />
              </li>
            </Link>
          )
        })}
      </ol>
    </Layout>
  )
}

export default BlogIndex

export const pageQuery = graphql`
  query {
    site {
      siteMetadata {
        title
      }
    }
    allMarkdownRemark(sort: { fields: [frontmatter___date], order: DESC }) {
      nodes {
        excerpt
        fields {
          slug
        }
        frontmatter {
          date(formatString: "MMMM DD, YYYY")
          title
          description
        }
      }
    }
  }
`
