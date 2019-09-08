import React, { Component } from 'react';

class Hello extends Component {

  constructor(props) {
    super(props);
    this.state = {
      count: 5
    };
  }

  render() {
    return (
      <div>
        <h1>Hello, {this.props.name || "World"}!</h1>
        <p>Count is: {this.state.count}!</p>
        <button type="button" onClick={this.incrementCount.bind(this)}>Increment</button>
      </div>
    );
  }

  incrementCount() {
    this.setState((prevState, props) => ({
      count: prevState.count + 1
    }));
  }

}

export default Hello;