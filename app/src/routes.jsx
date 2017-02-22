import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import Page from './components/page/'
import Home from './components/home/'

export default <Router history={browserHistory}>
    <Route path="/" component={Page}>
        <IndexRoute component={Home} />
    </Route>
</Router>