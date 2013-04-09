# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whisky/version'

Gem::Specification.new do |spec|
  spec.name          = "whisky"
  spec.version       = Whisky::VERSION
  spec.authors       = ["Sonny Scroggin"]
  spec.email         = ["scrogson@gmail.com"]
  spec.description   = %q{Whisky is a micro-framework built upon Rack.}
  spec.summary       = %q{Another Rack Micro-Framework.}
  spec.homepage      = "http://github.com/scrogson/whisky"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"

  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "erubis"
  spec.add_runtime_dependency "multi_json"
end
