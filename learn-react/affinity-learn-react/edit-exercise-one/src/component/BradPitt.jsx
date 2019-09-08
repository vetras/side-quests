import React from 'react';
import data from '../data.json';

class BradPitt extends React.Component {
  render() {

    return (
      <header>
        <div className='header-container'>

          <img src={data.user.photo} className="App-logo" alt="logo" />

          <h1>{data.user.name} {data.user.surname}</h1>

          <p className="header-social-container" >{data.user.description}</p>

          <div className='header-social-container' >
            {data.social.map((item) => (
              <a href={item.link} > {item.label}</a>
            ))}
          </div>

        </div>
      </header>
    );
  }
}

export default BradPitt;
