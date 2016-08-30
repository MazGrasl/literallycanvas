React = require './React-shim'
createSetStateOnEventMixin = require './createSetStateOnEventMixin'
{optionsStyles} = require '../optionsStyles/optionsStyles'
{_} = require '../core/localization'


Options = React.createClass
  displayName: 'Options'
  getState: -> {
    style: @props.lc.tool?.optionsStyle
    tool: @props.lc.tool
  }
  getInitialState: -> @getState()
  mixins: [createSetStateOnEventMixin('toolChange')]

  renderBody: ->
    # style can be null; cast it as a string
    style = "" + @state.style
    optionsStyles[style] && optionsStyles[style]({
      lc: @props.lc, tool: @state.tool, imageURLPrefix: @props.imageURLPrefix})

  renderLogo: ->
    {div,img,span} = React.DOM
    (div { className: 'logo-label' },
        (img { src: "#{@props.imageURLPrefix}/playbuttonschwarz.png" }),
        (span {},
            _("Analysis")
        )
    )

  render: ->
    {div} = React.DOM
    (div {className: 'lc-options horz-toolbar'},
      this.renderBody(),
      this.renderLogo()
    )

module.exports = Options
