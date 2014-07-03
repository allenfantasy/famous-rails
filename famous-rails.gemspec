# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'famous-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "famous-rails"
  spec.version       = Famous::Rails::VERSION
  spec.authors       = ["Allen Wu"]
  spec.email         = ["allenwu1018@gmail.com"]
  spec.summary       = %q{Use Famo.us in Ruby on Rails!}
  spec.description   = %q{This gem helps to use Famo.us in Ruby on Rails.}
  spec.homepage      = "https://github.com/allenfantasy/famous-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "railties", ">= 3.0", "< 5.0"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "httpclient", "~> 2.4"
end
