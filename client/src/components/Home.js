import React, { Component } from 'react';
import { Header } from 'semantic-ui-react';

const styles = {
  main: {
    border: 150,
    margin: 12,
    top: 10,
    right: '300px',
    bottom:20,
    left: '250px',
    position: 'relative',
  },
}


class Home extends Component {
  render() {
    return (
      <Header as='h1' textAlign='center' style={styles.main}>Project X</Header>
    );
  }
}

export default Home;
