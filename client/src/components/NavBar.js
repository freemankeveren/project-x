import React, { Component } from 'react';
import { Menu } from 'semantic-ui-react';
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import { handleLogout } from '../actions/auth';

const styles = {
  main: {
    margin: 0,
    top: 0,
    right: 60,
    bottom:20,
    right: 'auto',
    position: 'fixed',
    padding: '50px',
    background: 'grey'
  },
}

class NavBar extends Component {
  rightNavs = () => {
    const { user, dispatch, history } = this.props;

    if (user.id) {
      return (
        <Menu.Menu position='right'>
          <Menu.Item
            name='Logout'
            onClick={() => dispatch(handleLogout(history))}
          />
        </Menu.Menu>
      );
    }
    return (
      <Menu.Menu position='right'>

        <Link to='/login'>
          <Menu.Item name='Login' />
        </Link>
      </Menu.Menu>
    );
  }

  render() {
    return (
      <nav style={styles.main}>
        <Menu secondary>
          <Link to='/'>
            <Menu.Item name='Project X' />
          </Link>
          { this.rightNavs() }
        </Menu>
      </nav>
    );
  }
}

const mapStateToProps = state => {
  return { user: state.user };
};

export default withRouter(connect(mapStateToProps)(NavBar));
