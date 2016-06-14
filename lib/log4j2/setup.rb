# https://github.com/jruby/jruby/wiki/Persistence
if org.apache.logging.log4j.Logger.respond_to?(:__persistent__)
  org.apache.logging.log4j.Logger.__persistent__ = true
end
