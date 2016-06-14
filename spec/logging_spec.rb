#encoding: utf-8
require "log4j2"
require "json"

shared_context 'log capture' do
  let(:log_capture) { @log_stream.toString }
  before do
     @log_stream = java.io.ByteArrayOutputStream.new
     root_logger = org.apache.logging.log4j.LogManager.getLogger("jruby")
     context = root_logger.getContext()
     config = context.getConfiguration()

     appenders = config.getAppenders().keys()
     appenders.map {|x| config.removeAppender(x)}

     layout = org.apache.logging.log4j.core.layout.JsonLayout.createLayout(config, false, false, false, false, true, true, "[", "]", java.nio.charset.StandardCharsets::UTF_8)
     appender = org.apache.logging.log4j.core.appender.OutputStreamAppender.createAppender(layout, nil, @log_stream, "log_stream", false, true)
     appender.start()
     root_logger.addAppender(appender)
  end
end

class LogEnabledClass
  enable_logger

  def word(s)
    logger.error(s)
  end
end

describe "log4j2" do
  include_context 'log capture'

  it "logger enabled for class" do
    clazz = LogEnabledClass.new
    clazz.word("wow")

    expect(LogEnabledClass.logger.name).to eq('jruby.LogEnabledClass')
    json_capture = JSON.parse(log_capture)
    expect(json_capture["level"]).to eq("ERROR")
    expect(json_capture["loggerName"]).to eq("jruby.LogEnabledClass")
    expect(json_capture["logEvent"]["message"]).to eq("wow")
  end
end
