#!/usr/bin/env gem build
# encoding: utf-8

# Run ./tasks.gemspec or gem build tasks.gemspec
# NOTE: we can't use require_relative because when we run gem build, it use eval for executing this file
require File.join(File.dirname(__FILE__), "lib", "tasks", "version")
require "base64"

Gem::Specification.new do |s|
  s.name = "tasks"
  s.version = Tasks::VERSION
  s.authors = ["Jakub Stastny aka Botanicus"]
  s.homepage = "http://github.com/botanicus/tasks"
  s.summary = "" # TODO: summary
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = Base64.decode64() # TODO: your encrypted e-mail
  s.has_rdoc = true

  # files
  s.files = `git ls-files`.split("\n")

  s.executables = Dir["bin/*"].map(&File.method(:basename))
  s.default_executable = "tasks"
  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new(">= 1.9")

  # runtime dependencies
  # s.add_dependency "my-gem"

  # development dependencies
  # use gem install tasks --development if you want to install them
  # s.add_development_dependency "simple-templater"

  begin
    require "changelog"
  rescue LoadError
    warn "You have to have changelog gem installed for post install message"
  else
    s.post_install_message = CHANGELOG.new.version_changes
  end

  # RubyForge
  s.rubyforge_project = "tasks"
end
