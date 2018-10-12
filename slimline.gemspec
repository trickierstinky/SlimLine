$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "slimline/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "slimline"
  s.version     = Slimline::VERSION
  s.authors     = ["Matthew Deloughry"]
  s.email       = ["matt@deloughry.co.uk"]
  s.homepage    = "https://github.com/trickierstinky/SlimLine"
  s.summary     = "A small basic helper to allow progressively loading images"
  s.description = "A small basic helper to allow progressively loading images, Nothing really special this was done more as a test to myself to create a rails gem :)"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails" , ">= 3.1.0"

end
