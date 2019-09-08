import React, { Component } from 'react';
import Item from './Item.jsx';

function isEmpty(str) {
  return (!str || 0 === str.length || !str.trim());
}

class TodoList extends Component {

  constructor(props) {
    super(props);
    this.state = {
      items: [],
      currentItem: ''
    };
    this.addItem = this.addItem.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleChange(event) {
    this.setState({ currentItem: event.target.value });
  }

  handleDelete(index) {
    this.setState((prevState, props) => {
      prevState.items.splice(index, 1);
      return {
        items: prevState.items
      };
    });
  }

  addItem() {
    if (isEmpty(this.state.currentItem)) {
      return;
    }

    this.setState((prevState, props) => {
      prevState.items.push(this.state.currentItem)
      return {
        items: prevState.items,
        currentItem: ''
      };
    });
  }

  render() {

    var self = this;

    return (
      <div>
        <h1>{this.props.title || "Todo List"}</h1>

        <input
          type="text"
          value={this.state.currentItem}
          placeholder="Add a new element to the list"
          onChange={this.handleChange.bind(this)}
        />
        <button type="button" onClick={this.addItem}>Add</button>

        <ol>
          {
            this.state.items.map(function (item, i) {
              return <Item id={i} value={item} onDelete={self.handleDelete} />
            })
          }
        </ol>

      </div>
    );
  }

}

export default TodoList;