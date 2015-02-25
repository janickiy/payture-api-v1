# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payture/api/v1/version'

Gem::Specification.new do |spec|
  spec.name          = "payture-api-v1"
  spec.version       = Payture::Api::V1::VERSION
  spec.authors       = ["René Kersten"]
  spec.email         = ["rene.kersten@gmail.com"]
  spec.description   = %q{This library provides a wrapper to Version 1 of the Payture API}
  spec.summary       = %q{Payture API V1}
  spec.homepage      = "https://github.com/endorfin/payture-api-v1"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "coveralls"
end
