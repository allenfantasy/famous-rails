#!/usr/bin/env rake

require "bundler/gem_tasks"
require File.expand_path('../lib/famous-rails/source_file', __FILE__)

$:.unshift File.expand_path('../lib', __FILE__)
require 'famous-rails/version'

desc "Update library"
task :update do
  files = SourceFile.new

  # polyfills
  files.fetch("Famous", "polyfills", {
    "classList.js" => "javascripts/class_list.js",
    "functionPrototypeBind.js" => "javascripts/function_prototype_bind.js",
    "requestAnimationFrame.js" => "javascripts/request_animation_frame.js",
  })

  # requirejs
  files.fetch("jrburke", "requirejs", {
    "require.js" => "javascripts/require.js"
  })

  # famo.us
  files.fetch("Famous", "famous", {
    "dist/famous.css" => "stylesheets/famous.css",
    "dist/famous.min.js" => "javascripts/famous.js"
  })

end

task gem: :build
task :build do
  system 'gem build famous-rails.gemspec'
end

task release: :build do
  version = Famous::Rails::VERSION
  system "git tag -a v#{version} -m 'Tagging #{version}'"
  system "git push --tags"
  system "gem push famous-#{version}.gem"
  system "rm famous-#{version}.gem"
end
