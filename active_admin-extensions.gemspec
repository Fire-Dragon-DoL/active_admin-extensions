# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin/extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "active_admin-extensions"
  spec.version       = ActiveAdmin::Extensions::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]
  spec.summary       = %q{Collection of extensions for ActiveAdmin}
  spec.description   = %q{Collection of extensions for ActiveAdmin}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/active_admin-extensions"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "i18n"
  spec.add_dependency "activeadmin"
  spec.add_dependency "activesupport"
end
