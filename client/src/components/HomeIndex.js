import React, { Component } from 'react';
import { Header } from 'semantic-ui-react';

const styles = {
  main: {
    border: 150,
    margin: 12,
    top: 10,
    right: '300px',
    bottom: 0,
    left: '250px',
    position: 'relative',
    background: 'grey',
  },
}


class HomeIndex extends Component {
  render() {
    return (
      <div style={styles.main}>
        <Header as='h1' textAlign='center'>Project X</Header>
      </div>
      );
  }
}

export default HomeIndex;
