# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rhapsody/version'

Gem::Specification.new do |spec|
  spec.name          = "rhapsody"
  spec.version       = Rhapsody::VERSION
  spec.authors       = ["Jason Kim"]
  spec.email         = ["jasonkim@rhapsody.com"]

  spec.summary       = %q{A Ruby interface to the Rhapsody API.}
  spec.description   = %q{A Ruby interface to the Rhapsody API.}
  spec.homepage      = "https://github.com/serv/rhapsody"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
