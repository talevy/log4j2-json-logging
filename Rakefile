require 'rubygems'
require 'rubygems/package_task'
require 'jars/installer'
require 'fileutils'
require 'rspec/core/rake_task'

desc "Compile and publish"
task :compile do
  `gradle publishToMavenLocal`
end

spec = Gem::Specification.load('log4j2.gemspec')
Gem::PackageTask.new(spec) do
  desc 'Package gem'
  task :package => [:compile, :install_jars]
end

desc 'install vendored kafka jars from maven central'
task :install_jars => :compile do
  Jars::Installer.vendor_jars!('vendor/jar-dependencies')
end

RSpec::Core::RakeTask.new(:spec)
task :spec => :install_jars
task :test => :spec

desc 'clean it all'
task :clean do
  FileUtils.rm_rf('./pkg')
  FileUtils.rm_rf('./vendor')
  FileUtils.rm_rf('./lib/log4j2_jars.rb')
  FileUtils.rm_rf('.mvn')
  FileUtils.rm_rf('Gemfile.lock')
end
