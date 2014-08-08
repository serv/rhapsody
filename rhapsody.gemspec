# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rhapsody/version'

Gem::Specification.new do |spec|
  spec.name          = "rhapsody"
  spec.version       = Rhapsody::VERSION
  spec.authors       = ["Jason Kim"]
  spec.email         = ["jasonkim@rhapsody.com"]
  spec.summary       = %q{A Ruby object-oriented interface to the Rhapsody REST API}
  spec.description   = %q{Rhapsody REST API gem provides a Ruby object-oriented interface.}
  spec.homepage      = "https://github.com/serv/rhapsody"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
