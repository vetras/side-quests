import React, { Component } from "react";
import { graphql } from "react-apollo/index";

import "./styles.css";

class Footer extends Component {
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
    return <footer>I am the footer</footer>;
  }
}

export default Footer;
