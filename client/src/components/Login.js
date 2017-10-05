import React, { Component } from 'react';
import { Header, Segment, Form, Button } from 'semantic-ui-react';
import { connect } from 'react-redux';
import { handleLogin } from '../actions/auth';
import { Menu } from 'semantic-ui-react';
import { Link, withRouter } from 'react-router-dom';

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

class Login extends Component {
  state = { email: '', password: '' };

  handleChange = event => {
    const { id, value } = event.target;
    this.setState({ [id]: value });
  }

  handleSubmit = event => {
    event.preventDefault();
    const { dispatch, history } = this.props;
    const { email, password } = this.state;
    dispatch(handleLogin(email, password, history));
  }

  render() {
    const { email, password } = this.state;
    return (
      <Segment basic style={styles.main}>
        <Header as='h1' textAlign='center'>Login</Header>
        <Form onSubmit={this.handleSubmit}>
          <Form.Field>
            <label htmlFor='email'>Email</label>
            <input
              required
              id='email'
              value={email}
              placeholder='Email'
              onChange={this.handleChange}
            />
          </Form.Field>
          <Form.Field>
            <label htmlFor='password'>Password</label>
            <input
              required
              id='password'
              value={password}
              placeholder='Password'
              type='password'
              onChange={this.handleChange}
            />
          </Form.Field>
          <Segment textAlign='center' basic>
            <Button primary type='submit'>Submit</Button>
            <Link to='/register'>
              <Menu.Item name='Register' />
            </Link>
          </Segment>
        </Form>
      </Segment>
    );
  }
}

export default connect()(Login);
