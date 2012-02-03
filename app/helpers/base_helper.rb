module BaseHelper

  def attributes
    resource_class.attribute_names - %w(id created_at updated_at)
  end


  def get_url_for_resource
    if resource.id==nil
      collection_url
    else
      resource_url
    end
  end

  def table_actions(obj)

    res= obj.respond_to?(:model) ? obj.model : obj

    content_tag(:span, :class => 'list_actions') do
      actions=[]
      actions << content_tag(:span, link_to("",resource_url(res), :title => 'Visualizza', :class => 'btn small icon iinfo')) 
      actions << content_tag(:span, link_to("",edit_resource_url(res), :title => 'Modifica', :class => 'btn  small icon edit'))  
      actions << content_tag(:span, link_to("", resource_url(res), :method => :delete, :title => 'Cancella', :confirm => "Are you sure?", :class => 'btn small icon trash') )
      actions.join.html_safe
    end

  end


end
