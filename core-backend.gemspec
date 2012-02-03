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

  s.files = Dir["{app,config,db,lib}/***/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "rails", "~> 3.1.3"
  # s.add_runtime_dependency "jquery-rails"
  
  s.add_runtime_dependency 'rails3-jquery-autocomplete'
  s.add_runtime_dependency 'awesome_nested_set'
  s.add_runtime_dependency "best_in_place"
  s.add_runtime_dependency 'draper'

  s.add_runtime_dependency 'simple_form'
  s.add_runtime_dependency 'inherited_resources'
  s.add_runtime_dependency "tabletastic"
  s.add_runtime_dependency "attrtastic"
  s.add_runtime_dependency 'kaminari'
  s.add_runtime_dependency "ransack"
  s.add_runtime_dependency "cancan"

  s.add_runtime_dependency 'has_scope'
  s.add_runtime_dependency 'awesome_print'
  s.add_runtime_dependency 'deep_cloneable'

  s.add_development_dependency "sqlite3"
end
