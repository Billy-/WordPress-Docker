import React from 'react'
import CSSModules from 'react-css-modules'
import styles from './styles.css'

let Page = React.createClass({
  render() {
    return <div  styleName="page">
        <header>
        </header>
        <main>
          {this.props.children}
        </main>
    </div>
  }
})

export default CSSModules(Page, styles, {allowMultiple: true})