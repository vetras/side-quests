import React, { Component } from "react";
import { graphql } from "react-apollo/index";

import ProjectsListQuery from "./graphql/query";
import ProjectsListQueryOptions from "./graphql/options";
import ProjectListItem from "../ProjectListItem";

import mock from "./mock.json";

import "./styles.css";

class ProjectsList extends Component {
  static defaultProps = {
    projects: []
  };

  render() {
    const { projects } = mock;

    const Projects = projects.map(project => (
      <ProjectListItem
        key={project.id}
        id={project.id}
        title={project.title}
        description={project.description}
        coverPhotoUrl={
          project.images && project.images.length ? project.images[0].url : ""
        }
        technologies={project.technologies}
      />
    ));

    return <div className="projects-list-ctn">{Projects}</div>;
  }
}

export default graphql(ProjectsListQuery, ProjectsListQueryOptions)(
  ProjectsList
);
