package org.logstash.log;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import org.apache.logging.log4j.core.LogEvent;
import org.apache.logging.log4j.core.config.plugins.Plugin;
import org.apache.logging.log4j.core.config.plugins.PluginFactory;
import org.apache.logging.log4j.core.jackson.Log4jJsonObjectMapper;
import org.apache.logging.log4j.core.layout.AbstractStringLayout;
import org.apache.logging.log4j.util.Strings;

import java.io.StringWriter;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

@Plugin(name = "JSONObjectLayout", category = "Core", elementType = "layout", printObject = true)
public class JSONObjectLayout extends AbstractStringLayout {

    public JSONObjectLayout() {
        this(StandardCharsets.UTF_8);
    }

    public JSONObjectLayout(Charset charset) {
        super(charset);
    }

    @Override
    public String toSerializable(LogEvent event) {
        try {
            final StringWriter stringWriter = new StringWriter();
            final JsonGenerator g = new JsonFactory().createGenerator(stringWriter);
            Log4jJsonObjectMapper m = new Log4jJsonObjectMapper();
            g.writeStartObject();
            g.writeFieldName("my_map");
            m.writeValue(g, event.getMessage().getParameters()[0]);
            g.writeEndObject();
            stringWriter.append("\n");
            return stringWriter.toString();
        } catch (Exception e) {
            LOGGER.error("wtf", e);
        }
        return Strings.EMPTY;
    }

    @PluginFactory
    public static JSONObjectLayout createLayout() {
        return new JSONObjectLayout();
    }
}
