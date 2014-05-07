#!/usr/bin/env rake

require 'rspec/core/rake_task'
require File.expand_path('../src/app', __FILE__)

RSpec::Core::RakeTask.new(:spec)

task :default  => :spec

desc "Run the app in batch mode"
task :batch do
  app = App.new :batch, "50 50 10 20 N LMLMLMLMM 3 3 E MMRMMRMRRM"
  app.run
end

desc "Run the app in interactive mode"
task :interactive do
  app = App.new :interactive
  app.run
end
