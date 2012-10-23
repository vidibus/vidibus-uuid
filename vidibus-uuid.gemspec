# -*- encoding: utf-8 -*-

lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "vidibus/uuid/version"

Gem::Specification.new do |s|
  s.name        = "vidibus-uuid"
  s.version     = Vidibus::Uuid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Andre Pankratz"
  s.email       = "andre@vidibus.com"
  s.homepage    = "https://github.com/vidibus/vidibus-uuid"
  s.summary     = "Provides UUID generation through UUID gem."
  s.description = "Provides UUID generation for Mongoid models. It includes a validator for UUIDs."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "vidibus-uuid"

  s.add_dependency 'mongoid', '~> 3.0'
  s.add_dependency "uuid", "~> 2.3.1"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "rspec", "~> 2"
  s.add_development_dependency "rr"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
