import React from 'react';
import { shallow } from 'enzyme';
import Page from '../src/components/page';

const wrapper = shallow(<Page />)

test('Page renders without exploding', () => {
    expect(wrapper).toHaveLength(1)
})