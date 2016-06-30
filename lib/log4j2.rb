module Log4j2
end

require 'jars'
require 'log4j2/setup'
require 'log4j2/logger_for_class'

Object.class_eval do
  class <<self
    def enable_logger
      send(:include, Log4j2::LoggerForClass)
    end
  end
end
