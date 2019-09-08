import React, { Component, Fragment } from "react";
import { BrowserRouter as Router, Route } from "react-router-dom";

import Header from "./components/Header/index";
import Footer from "./components/Footer";
import ProjectsList from "./components/ProjectsList";

import "./App.css";

export default class App extends Component {
  render() {
    return (
      <Fragment>
        <Header />
        <Router>
          <section className={"main"}>
            <Route exact path="/" component={ProjectsList} />
            <Route
              exact
              path="/project/:id"
              component={() => <p>project detail</p>}
            />
          </section>
        </Router>
        <Footer />
      </Fragment>
    );
  }
}
