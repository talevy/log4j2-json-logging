package org.logstash.log;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.apache.logging.log4j.message.Message;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@JsonSerialize(using = CustomLogEventSerializer.class)
public class StructuredMessage implements Message {
    private final String message;
    private final Map<String, Object> params;

    public StructuredMessage(String message) {
        this(message, Collections.emptyMap());
    }

    public StructuredMessage(String message, Object... params) {
        Map<String, Object> paramsMap = new HashMap<>();
        try {
            for (int i = 0; i < params.length; i += 2) {
                paramsMap.put((String) params[i], params[i + 1]);
            }
        } catch (IndexOutOfBoundsException e) {
            throw new IllegalArgumentException("must log key-value pairs");
        }
        this.message = message;
        this.params = paramsMap;
    }

    public StructuredMessage(String message, Map<String, Object> params) {
        this.message = message;
        this.params = params;
    }

    public String getMessage() {
        return message;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    @Override
    public Object[] getParameters() {
        return params.values().toArray();
    }

    @Override
    public String getFormattedMessage() {
        String formatted = message;
        if (params != null) {
            formatted += " " + params;
        }
        return formatted;
    }

    @Override
    public String getFormat() {
        return null;
    }


    @Override
    public Throwable getThrowable() {
        return null;
    }

    static class Builder {
        private final String message;
        private final Map<String, Object> params;

        public Builder(String message) {
            this.message = message;
            this.params = new HashMap<>();
        }

        public Builder setParam(String name, Object value) {
            this.params.put(name, value);
            return this;
        }

        public StructuredMessage build() {
            return new StructuredMessage(message, params);
        }
    }
}
