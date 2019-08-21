/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import sinon from 'sinon';
import React from 'react';
import { Button, Input, FormGroup, Alert } from 'reactstrap';
import Feedback from '../../components/Feedback';
import * as api from '../../utils/helper';

describe('<Feedback />', () => {
  it('should render correctly', () => {
    const wrapper = mount(<Feedback />);
    const formGroups = wrapper.find(FormGroup);
    const button = wrapper.find(Button);

    assert.strictEqual(formGroups.length, 2);
    assert.strictEqual(formGroups.at(0).find(Input).prop('name'), 'name');
    assert.strictEqual(formGroups.at(1).find('textarea').prop('name'), 'comments');
    assert.strictEqual(button.length, 1);
    assert.strictEqual(button.text(), 'Submit');
  });

  it('should change value with input', () => {
    const wrapper = mount(<Feedback />);
    wrapper.find(Input).first().simulate('change', { target: { name: 'name', value: 'tester' } });
    assert.strictEqual(wrapper.find(Input).at(0).prop('value'), 'tester');
  });

  it('should post when submit', () => {
    const wrapper = mount(<Feedback />);
    const post = sinon.stub(api, 'post');
    post.resolves();
    wrapper.find(Button).simulate('submit');
    assert(post.calledOnce);
    post.restore();
  });

  it('should have no alerts when no submission', () => {
    const wrapper = mount(<Feedback />);
    assert.strictEqual(wrapper.find(Alert).length, 0);
  });

  it('should show success alert when valid', async () => {
    const wrapper = mount(<Feedback />);
    wrapper.find(Input).at(0).simulate('change', { target: { name: 'tester' } });
    wrapper.find(Input).at(1).simulate('change', { target: { comments: 'testing' } });

    const post = sinon.stub(api, 'post').resolves({});

    await wrapper.find(Button).simulate('submit');
    assert(post.calledOnce);
    wrapper.update();
    assert.strictEqual(wrapper.find(Alert).prop('color'), 'success');
    post.restore();
  });

  it('should show failed alert when invalid', async () => {
    const wrapper = mount(<Feedback />);
    wrapper.find(Input).at(0).simulate('change', { target: { name: 'tester' } });

    const post = sinon.stub(api, 'post').rejects();

    await wrapper.find('Form').prop('onSubmit')({ preventDefault: () => {} });
    assert(post.calledOnce);
    wrapper.update();
    assert.strictEqual(wrapper.find(Alert).prop('color'), 'danger');
    post.restore();
  });
});
