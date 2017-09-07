$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "external_storage/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "external_storage"
  s.version     = ExternalStorage::VERSION
  s.authors     = ["Daniel Pierce"]
  s.email       = ["dlpierce@indiana.edu"]
  s.homepage    = "https://github.com/samvera-labs/samvera-external_storage"
  s.summary     = "Hyrax external file storage controls"
  s.description = "Hyrax external file storage controls"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"
  s.add_dependency "hyrax"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "engine_cart"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "bixby"
  s.add_development_dependency "fcrepo_wrapper"
  s.add_development_dependency "solr_wrapper"
end
