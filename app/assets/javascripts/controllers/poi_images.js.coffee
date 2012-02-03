hovercard=(el,selDiv) ->
  html=selDiv.html()
  $(el).hovercard
    width: 600
    detailsHTML: html



PubSub.subscribe 'poi_images_error_updated', (msg,data) ->
  errors="#{k}:#{v.join("<br/>")}" for k,v of data
  $("#alert-error").notify "create", 
    title: 'Errore'
    text: errors
  

PubSub.subscribe 'poi_images_updated', (msg,data) ->
  $("#alert-success").notify "create", 
    title: 'Immagine salvata'
    text: "immagine #{data.name} salvata con successo"
  

PubSub.subscribe 'poi_images_load', (msg,data) ->


  jQuery(".best_in_place").best_in_place()
  $(".thumbs .row").each ->
    thumb=@
    $("div.upload_image",@).each ->
      html=$(".form_upload",thumb).html()
      $(@).hovercard
        width: 600
        detailsHTML: html
    $("div.anagrafica",@).each ->
      html=$(".form_anagrafica",thumb).html()
      $(@).hovercard
        width: 450
        detailsHTML: html
    $("div.didascalie",@).each ->
      html=$(".form_didascalie",thumb).html()
      $(@).hovercard
        width: 450
        detailsHTML: html
    $("div.diritti",@).each ->
      html=$(".form_diritti",thumb).html()
      $(@).hovercard
        width: 450
        detailsHTML: html
    
    
        