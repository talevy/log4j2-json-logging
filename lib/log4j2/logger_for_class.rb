require 'log4j2'

module Log4j2
  module LoggerForClass
    def self.included(klass)
      def klass.logger
        @logger ||= org.apache.log4j.LogManager.get(name)
      end
    end

    def logger
      self.class.logger
    end
  end
end

