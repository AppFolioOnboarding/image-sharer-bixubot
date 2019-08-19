import React from 'react';
import { Button, Form, FormGroup, Label, Input } from 'reactstrap';

export default class Feedback extends React.Component {
  render() {
    return (
      <Form className="container">
        <FormGroup>
          <Label for="name">Your name:</Label>
          <Input type="text" name="name" id="name" />
        </FormGroup>
        <FormGroup>
          <Label for="comments">Comments:</Label>
          <Input type="textarea" name="comments" id="comments" />
        </FormGroup>
        <Button color="primary" type="submit">Submit</Button>
      </Form>
    );
  }
}
