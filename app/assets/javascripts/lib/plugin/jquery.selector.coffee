do ->

  text_selected=""

  ajax= (url,params) ->
    $.ajax
      url:url
      type:"POST"
      data:params

  Kolich = {}  unless window.Kolich
  Kolich.Selector = {}
  Kolich.Selector.getSelected = ->
    t = ""
    if window.getSelection
      t = window.getSelection()
    else if document.getSelection
      t = document.getSelection()
    else t = document.selection.createRange().text  if document.selection
    t

  Kolich.Selector.mouseup = ->
    st = Kolich.Selector.getSelected()
    st.toString()

  elaborate_text = ->
    console.log  $(this).attr("data-selection-text-url")
    txt = Kolich.Selector.mouseup.apply(this)
    
    ajax $(this).attr("data-selection-text-url"), 
      text_selection:txt
    .then (html) ->
      console.log html
      $("#modal-text .modal-body").html(html)
      $("#modal-text").modal("show")
       
    #$("#modal-text")
    #.find(".modal-body")
    #.load $(this).attr("data-selection-text-url"), ->
    #  $("#modal-text").modal "show"

  $(".book_version_text td.text")
  
  jQuery.fn.selection_text= -> 
    $(this).each ->
      $(this).bind("mouseup", elaborate_text)
  
  $(document).ready ->
    $("#modal-text").modal backdrop: true
    $(".book_version_text td.text div").selection_text()