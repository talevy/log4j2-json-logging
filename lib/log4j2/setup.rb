# https://github.com/jruby/jruby/wiki/Persistence
if org.apache.log4j.Logger.respond_to?(:__persistent__)
  org.apache.log4j.Logger.__persistent__ = true
end
