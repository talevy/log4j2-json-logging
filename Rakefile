require 'rubygems'
require 'rubygems/package_task'
require 'fileutils'
require 'rspec/core/rake_task'

desc "Compile and publish"
task :compile do
  `./gradlew jar`
end


task :install_jars => :compile do
  `cp -r build/libs lib`
end

task :vendor => :install_jars

spec = Gem::Specification.load('log4j2.gemspec')
Gem::PackageTask.new(spec) do
  desc 'Package gem'
  task :package => [:compile, :install_jars]
end

RSpec::Core::RakeTask.new(:spec)
task :spec => :install_jars
task :test => :spec
