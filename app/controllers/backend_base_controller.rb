class BackendBaseController  < InheritedResources::Base

  protect_from_forgery
  respond_to :xml,:json,:html,:js
  helper :base

  layout :get_layout

  def get_layout
    request.xhr? ? nil : 'backend_base'
  end




end
