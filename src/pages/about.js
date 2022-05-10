import * as React from "react"
import "../style/about.css"

import Layout from "../components/layout"

const About = () => {
  return (
    <Layout location="/about" title="about">
      <div className="about-container">
        <div className="about-main-section-a">
          <div className="about-title">Hi, I'm Robert D'Ippolito</div>
          <div className="about-body">
            I'm an engineering manager at Ada - currently based out of Toronto,
            Canada.
            <br className="about-break" />I graduated from the University of
            Toronto in 2015 with a civil engineering degree focused on
            structural engineering and a minor in business. I was a participant
            in the University of Toronto's incubator called the Hatchery where I
            started MentorMee a mentorship platform for highschool and
            university students.
            <br className="about-break" />I have over 6 years of consulting
            experience building digital products on AWS for enterprise clients
            across many industries.
          </div>
        </div>
        <div className="about-main-section-b">
          <div className="about-title">Why Amazon Web Services?</div>
          <div className="about-body">
            I have been focused on building cloud native solutions on AWS for
            the last 3 years. In that time I have built call centers,
            conversational user interfaces, data lakes and web applications that
            have served hundreds of thousands of end users.
            <br className="about-break" />I am an AWS certified solution
            architect associate and certified Terraform associate.
            <br className="about-break" />I am fascinated with the concept of
            continuous integration and delivery and believe that it is
            fundemental to achieving IT objectives in todays fluid operating
            environment. I think AWS is incredibly well positioned as a modern
            cloud provider to help organizations big and small easily build
            useful solutions for their customers.
          </div>
        </div>
        <div className="about-main-section-c">
          <div className="about-title">The Goal for the Blog</div>
          <div className="about-body">
            The goal for this blog is to document my personal cloud projects and
            provide insights to fellow builders who may be looking for
            information on a specific tool or concept.
            <br className="about-break" />
            The other goal of this blog is to collaborate. I am in awe of the
            power of modern software development and believe when combined with
            community the possibilities are endless. If you have a problem or an
            idea I would love to hear it. Do not hesitate to reach out via
            Twitter or Github.
          </div>
        </div>
      </div>
    </Layout>
  )
}

export default About
