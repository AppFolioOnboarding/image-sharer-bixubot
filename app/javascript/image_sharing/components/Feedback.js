import React from 'react';
import { Button, Form, FormGroup, Label, Input, Alert } from 'reactstrap';
import { post } from '../utils/helper';

export default class Feedback extends React.Component {
  constructor() {
    super();
    this.state = {
      name: '',
      comments: '',
      show: false,
      message: '',
      color: ''
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  clearInputs() {
    this.setState({ name: '' });
    this.setState({ comments: '' });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.clearInputs();

    return post('/api/feedbacks', this.state)
      .then(() => {
        this.setState({ show: true });
        this.setState({ message: 'Thank you for your feedback!' });
        this.setState({ color: 'success' });
      }).catch(() => {
        this.setState({ show: true });
        this.setState({ message: 'Please fill out all fields and submit again.' });
        this.setState({ color: 'danger' });
      });
  }

  handleChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  render() {
    return (
      <Form className="container" onSubmit={this.handleSubmit}>
        { this.state.show && <Alert color={this.state.color}>{this.state.message}</Alert> }
        <FormGroup>
          <Label for="name">Your name:</Label>
          <Input type="text" name="name" id="name" onChange={this.handleChange} value={this.state.name} />
        </FormGroup>
        <FormGroup>
          <Label for="comments">Comments:</Label>
          <Input type="textarea" name="comments" id="comments" onChange={this.handleChange} value={this.state.comments} />
        </FormGroup>
        <Button color="primary" type="submit">Submit</Button>
      </Form>
    );
  }
}
