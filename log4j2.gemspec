VERSION = IO.read("VERSION")

Gem::Specification.new do |s|
  s.name = 'log4j2'
  s.version = VERSION
  s.authors = ['Tal Levy']
  s.email = ['tal@elastic.co']
  s.description = 'A Jruby Gem for Log4j2'
  s.summary = 'Log4j2 gem'
  s.homepage = 'https://github.com/talevy/log4j2-json-logging'
  s.license = 'Apache 2.0'
  s.platform = 'java'
  s.require_paths = ['lib', 'vendor/jars']

  s.files = Dir[ 'lib/**/*', 'vendor/**/*', 'spec/**/*', 'Gemfile', '*.gemspec']
  s.test_files = Dir[ 'spec/**/*.rb' ]

  s.add_development_dependency 'jar-dependencies', '~> 0.3.4'
  s.add_development_dependency 'rake', '~> 10.5'
  s.add_development_dependency 'rspec', '~> 3.1.0'
end
