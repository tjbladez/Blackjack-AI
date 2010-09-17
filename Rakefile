require 'rubygems'
require 'rake'
require 'rake/testtask'

desc 'Running tests by default'
task :default => ["tests"]

Rake::TestTask.new("tests") do |test|
  test.libs    << 'test'
  test.pattern =  'test/*_test.rb'
  test.warning =  true
  test.verbose =  false
end