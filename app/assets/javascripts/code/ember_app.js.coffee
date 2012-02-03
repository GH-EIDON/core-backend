ParagraphBase= ->
  Ember.Object.extend 
    id:0,
    name:''
    selected:false

AppContextBase= ->
  Ember.Object.extend 
    book_id:null
    version_id:null
    book_version_text_id:null
    text_selected:null
    poi_selected:null
    paragraph_selected:null
    paragraph_is_associated_to_text:false
    session_finished:false
    paragraphs: Em.ArrayController.create
      content: []
    multiSet: (hash) ->  @set(k,v) for k,v of hash
  
    
window.PoiParagraphAppGenerator= (context) ->

  app = Ember.Application.create
    name:"ciao"
    
  app.Paragraph= do ->
    
    selectedChange= -> 
      app.context.set('paragraph_selected',this)
      @associateToTextSelected(app.context)
      
    associateToTextSelected= ->
      {book_id,version_id,book_version_text_id,text_selected}=context
      url="/books/#{book_id}/versions/#{version_id}/book_version_texts/#{book_version_text_id}/associate_paragraph.json"
      $.post url, 
        {book_text:{
          paragraph: @get("id")
          text_selection: text_selected
        }},
      .then -> 
        console.log "ciao"
        app.context.set("paragraph_is_associated_to_text",true)
      
    return ParagraphBase().extend
      selectedChange: selectedChange.observes("selected")
      associateToTextSelected:associateToTextSelected
        
  app.setContext= (opt) ->
    @context.multiSet
      book_id:opt.book_id
      version_id:opt.version_id
      text_selected:opt.text_selected
      book_version_text_id:opt.book_version_text_id
          
  app.context= do ->
    poi_selected_change= ->
      url="/books/#{@get('book_id')}/paragraphs.json?by_poi=#{@get('poi_selected')}"
      $.getJSON(url).then (json) ->
        app.context.paragraphs.removeObjects(app.context.paragraphs)
        json.forEach (par) -> app.context.paragraphs.pushObject(app.Paragraph.create(par))
    
    
    AppContextBase().create
      poi_selected_change: poi_selected_change.observes('poi_selected')
    
  app.views=  
    main:Ember.View.create
      templateName: 'code/poi_paragraph'
    paragraph:Ember.View.extend
      click: -> @content.set('selected',true)
    button_close:Ember.View.extend
      click: -> app.context.set('session_finished',true)

  app.setContext(context)
  app