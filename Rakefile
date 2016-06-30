require 'rubygems'
require 'rubygems/package_task'
require 'fileutils'
require 'rspec/core/rake_task'

desc "Compile and vendor java into ruby"
task :vendor do
  `./gradlew vendor`
end


spec = Gem::Specification.load('log4j2.gemspec')
Gem::PackageTask.new(spec) do
  desc 'Package gem'
  task :package => [:vendor]
end

RSpec::Core::RakeTask.new(:spec)
task :check => [:vendor, :spec]
