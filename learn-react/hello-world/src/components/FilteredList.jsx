import React, { Component } from 'react';

class FilteredList extends Component {

  constructor(props) {

    super(props);

    var items = [
      "Apples",
      "Broccoli",
      "Chicken",
      "Duck",
      "Eggs",
      "Fish",
      "Granola",
      "Hash Browns"
    ];

    this.state = {
      initialItems: items,
      items: items
    };
  }

  filterList(event) {
    var updatedList = this.state.initialItems;
    updatedList = updatedList.filter(function (item) {
      return item.toLowerCase().search(
        event.target.value.toLowerCase()) !== -1;
    });
    this.setState({ items: updatedList });
  }

  render() {
    return (
      <div className="filter-list">
        <input type="text" placeholder="Search" onChange={this.filterList.bind(this)} />
        <List items={this.state.items} />
      </div>
    );
  }

}

class List extends Component {

  render() {
    return (
      <ul>
        {
          this.props.items.map(function (item) {
            return <li key={item}>{item}</li>
          })
        }
      </ul>
    )
  }

}

export default FilteredList;