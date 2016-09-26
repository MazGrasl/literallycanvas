React = require './React-shim'
createSetStateOnEventMixin = require './createSetStateOnEventMixin'
{_} = require '../core/localization'
{classSet} = require '../core/util'

SaveButton = React.createClass
  displayName: 'SaveButton'
  getState: -> {isEnabled: @props.lc.canUndo()}
  getInitialState: -> @getState()
  mixins: [createSetStateOnEventMixin('drawingChange')]

  render: ->
    {div} = React.DOM
    {lc, imageURLPrefix} = @props

    className = classSet
      'lc-save': true
      'toolbar-button': true
      'fat-button': true
      'disabled': not @state.isEnabled
    onClick = if lc.canUndo() then (=> lc.download()) else ->

    (div {
        className, onClick, style: {
            'backgroundImage': "url(#{imageURLPrefix}/ic_save_black_24dp_2x.png)",
            'backgroundSize': 'contain',
            'backgroundRepeat': 'no-repeat',
            'backgroundPosition': 'center'
        }
    })


module.exports = SaveButton
