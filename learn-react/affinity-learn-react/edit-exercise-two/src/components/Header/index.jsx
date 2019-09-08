import React, { Component } from "react";
import { graphql } from "react-apollo/index";

import HeaderQuery from "./graphql/query";
import HeaderQueryOptions from "./graphql/options";

import "./styles.css";

export class Header extends Component {
  static defaultProps = {
    name: "",
    description: "",
    photo: {
      url: ""
    },
    linkedInUrl: "",
    facebookUrl: "",
    twitterUrl: ""
  };

  render() {
    const {
      loading,
      personalDetails
    } = this.props;

    if (loading) {
      return <p>LOADING</p>
    }

    return (
      <header>
        <div className={"header-container"}>
          <img src={null} alt={""} className="header-photo" />
          <h1>{personalDetails.name}</h1>
          <p>{personalDetails.description}</p>
          <div className={"header-social-container"}>
            <a href="" target="_blank">
              <i className="fab fa-twitter" /> Twitter
            </a>
            <a href="" target="_blank">
              <i className="fab fa-facebook-f" /> Facebook
            </a>
            <a href="" target="_blank">
              <i className="fab fa-linkedin-in" /> LinkedIn
            </a>
          </div>
        </div>
      </header>
    );
  }
}

export default graphql(HeaderQuery, HeaderQueryOptions)(Header);
