import React, { Component } from 'react';

class Item extends Component {

  constructor(props) {
    super(props);
    this.state = {
      id: this.props.id
    };
    this.delete = this.delete.bind(this);
  }

  delete() {
    this.props.onDelete(this.state.id);
  }

  render() {
    return (
      <li key={this.props.value} class="fa fa-trash" onClick={this.delete}>{this.props.value}</li>
    );
  }

}

export default Item;