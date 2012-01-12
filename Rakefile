require "bundler/gem_tasks"
require 'rspec/core/rake_task'
Bundler.setup(:default, :development)


desc "Run all RSpec tests"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
