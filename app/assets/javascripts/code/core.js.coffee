class @AceEditor
  constructor: (@options) ->
      @init()
      @config()
      @setChangeContent()
    
  init: ->
    @edit = ace.edit @options.el_id
    @session=@edit.getSession()
    @dom_el=document.getElementById(@options.el_id)
    Mode = require("ace/mode/#{@options.mode}").Mode #unless @options.mode
    @edit.getSession().setMode new Mode()
    @edit.setTheme("ace/theme/#{@options.theme}") #unless @options.theme
    @session.setValue($(@options.sel_textarea).val())

  config: ->
    @dom_el.style.fontSize = "14px"
    @dom_el.style.lineHeight = "20px"
    @edit.setShowPrintMargin true
    @edit.setBehavioursEnabled true
    @edit.getSession().setTabSize 2
    
  setChangeContent: ->  
    @edit.getSession().on "change", => $(@options.sel_textarea).val @edit.getSession().getValue()
      
      
class @core
  hoverCard:
    inPlace: (@opt) ->
      $(opt.sel).hovercard
        detailsHTML: @opt.inPlace
        width: 500
        