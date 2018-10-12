$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "slimline/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "slimline"
  s.version     = Slimline::VERSION
  s.authors     = ["Matthew Deloughry"]
  s.email       = ["matt@deloughry.com"]
  s.homepage    = "https://deloughry.co.uk"
  s.summary     = "Give a nice helper to progressively load images"
  s.description = "Give a nice helper to progressively load images"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails" , ">= 3.1.0"

end
