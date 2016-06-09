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
task :install_jars do
  # ENV['JARS_VENDOR'] = 'false'
  ENV['JARS_HOME'] = 'lib/jar-dependencies'
  Jars::Installer.new.vendor_jars!(false)
end

desc 'clean it all'
task :clean do
  FileUtils.rm_rf('./pkg')
  FileUtils.rm_rf('./lib/jar-dependencies')
  FileUtils.rm_rf('./lib/*_jars.rb')
  FileUtils.rm_rf('.mvn')
  FileUtils.rm_rf('Gemfile.lock')
end
