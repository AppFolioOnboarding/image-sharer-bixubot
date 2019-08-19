/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import { Button, Input, FormGroup } from 'reactstrap';
import Feedback from '../../components/Feedback';

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
});
