# this is a generated file, to avoid over-writing it just delete this comment
begin
  require 'jar_dependencies'
rescue LoadError
  require 'com/fasterxml/jackson/core/jackson-core/2.7.4/jackson-core-2.7.4.jar'
  require 'com/fasterxml/jackson/core/jackson-annotations/2.7.0/jackson-annotations-2.7.0.jar'
  require 'org/logstash/log/log4j2-json-logging/1.0.0-SNAPSHOT/log4j2-json-logging-1.0.0-SNAPSHOT.jar'
  require 'org/apache/logging/log4j/log4j-core/2.5/log4j-core-2.5.jar'
  require 'org/apache/logging/log4j/log4j-api/2.5/log4j-api-2.5.jar'
  require 'com/fasterxml/jackson/core/jackson-databind/2.7.4/jackson-databind-2.7.4.jar'
end

if defined? Jars
  require_jar( 'com.fasterxml.jackson.core', 'jackson-core', '2.7.4' )
  require_jar( 'com.fasterxml.jackson.core', 'jackson-annotations', '2.7.0' )
  require_jar( 'org.logstash.log', 'log4j2-json-logging', '1.0.0-SNAPSHOT' )
  require_jar( 'org.apache.logging.log4j', 'log4j-core', '2.5' )
  require_jar( 'org.apache.logging.log4j', 'log4j-api', '2.5' )
  require_jar( 'com.fasterxml.jackson.core', 'jackson-databind', '2.7.4' )
end
