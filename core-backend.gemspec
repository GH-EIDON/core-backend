$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "core-backend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "core-backend"
  s.version     = CoreBackend::VERSION
  s.authors     = ["wdwd@efefe.com"]
  s.email       = ["efwfewfwefew@efwef.com"]
  s.homepage    = "http://wefewfwef"
  s.summary     = "Summary of CoreBackend."
  s.description = "Description of CoreBackend."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"
  
  s.add_dependency 'rails3-jquery-autocomplete'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency "best_in_place"
  s.add_dependency 'draper'

  s.add_dependency 'simple_form'
  s.add_dependency 'inherited_resources'
  s.add_dependency "tabletastic"
  s.add_dependency "attrtastic"
  s.add_dependency 'kaminari'
  s.add_dependency "ransack"
  s.add_dependency "cancan"

  s.add_dependency 'has_scope'
  s.add_dependency 'awesome_print'
  s.add_dependency 'deep_cloneable'

  s.add_development_dependency "sqlite3"
end
