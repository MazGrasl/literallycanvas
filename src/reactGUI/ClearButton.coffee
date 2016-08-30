React = require './React-shim'
createSetStateOnEventMixin = require './createSetStateOnEventMixin'
{_} = require '../core/localization'
{classSet} = require '../core/util'

ClearButton = React.createClass
  displayName: 'ClearButton'
  getState: -> {isEnabled: @props.lc.canUndo()}
  getInitialState: -> @getState()
  mixins: [createSetStateOnEventMixin('drawingChange')]

  render: ->
    {div} = React.DOM
    {lc, imageURLPrefix} = @props

    className = classSet
      'lc-clear': true
      'toolbar-button': true
      'fat-button': true
      'disabled': not @state.isEnabled
    onClick = if lc.canUndo() then (=> lc.clear()) else ->

    (div {
        className, onClick, style: {
            'backgroundImage': "url(#{imageURLPrefix}/ic_delete_black_24dp_2x.png)",
            'background-size': 'contain',
            'background-repeat': 'no-repeat',
            'background-position': 'center'
        }
    })


module.exports = ClearButton
