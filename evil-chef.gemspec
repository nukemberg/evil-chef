# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'evil-chef/version'

Gem::Specification.new do |spec|
  spec.name          = "evil-chef"
  spec.version       = Evil::Chef::VERSION
  spec.authors       = ["Avishai Ish-Shalom"]
  spec.email         = ["avishai@fewbytes.com"]
  spec.description   = %q{Run Chef as a library from within other applications}
  spec.summary       = %q{Run Chef as a library from within other applications}
  spec.homepage      = ""
  spec.license       = "Apache V2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.1.0"

  spec.add_dependency "chef", ">= 11.4.0"
end
