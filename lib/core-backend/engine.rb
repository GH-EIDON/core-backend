require 'rubygems'
require 'rails3-jquery-autocomplete'
require 'awesome_nested_set'
require "best_in_place"
require 'draper'

require 'simple_form'
require 'inherited_resources'
require "tabletastic"
require "attrtastic"
require 'kaminari'
require "ransack"
require "cancan"

require 'has_scope'
require 'awesome_print'
require 'deep_cloneable'


module CoreBackend
  class Engine < Rails::Engine
    isolate_namespace CoreBackend
  end
end
