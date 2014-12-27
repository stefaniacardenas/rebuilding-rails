# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runways/version'

Gem::Specification.new do |spec|
  spec.name          = "runways"
  spec.version       = Runways::VERSION
  spec.authors       = ["Stefania F. Cardenas"]
  spec.email         = ["stefaniaferullo@hotmail.com"]
  spec.summary       = ["Building my own Ruby Web Framework"]
  spec.description   = ["Runways is a Rails-like Web Framework built in Ruby"]
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
