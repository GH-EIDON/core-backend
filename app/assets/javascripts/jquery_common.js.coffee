$(document).ready ->
  $('#books tr.book').each ->
    $("td:first a",this).bootstrapPopover()
  #$(".tabs").tabs()