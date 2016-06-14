require 'log4j2'

module Log4j2
  module LoggerForClass
    def self.included(klass)
      def klass.logger
        name = "jruby.#{self.name.gsub('::', '.')}"
        @logger ||= org.apache.logging.log4j.LogManager.getLogger(name)
      end
    end

    def logger
      self.class.logger
    end
  end
end

