require 'inherited_resources'
require 'simple_form'
require 'inherited_resources'
require "tabletastic"
require "attrtastic"
require 'kaminari'
require "ransack"
require 'has_scope'
require 'awesome_print'
require 'rails3-jquery-autocomplete'
require 'awesome_nested_set'
require "best_in_place"
require "cancan"



class BackendBaseController  < InheritedResources::Base

  protect_from_forgery
  respond_to :xml,:json,:html,:js
  helper :base

  layout :get_layout

  def get_layout
    request.xhr? ? nil : 'backend_base'
  end




end
