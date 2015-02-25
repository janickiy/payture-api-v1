require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
end

desc "Run tests"
task :default => :test

desc "Coverage Report"
task :coverage do
  system('bundle exec coveralls report')
end