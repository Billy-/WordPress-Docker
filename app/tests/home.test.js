import React from 'react';
import { shallow } from 'enzyme';
import Home from '../src/components/home';

const wrapper = shallow(<Home />)

describe('<Home />', () => {
    it('Should render without exploding', () => {
        expect(wrapper).toHaveLength(1)
    })

    it('Says "Hello World!"', () => {
        expect(wrapper.text()).toEqual('Helo World!')
    })
})