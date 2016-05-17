package org.logstash.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Main {
    private static final Logger logger = LogManager.getLogger("HelloWorld");

    static class What {
        private String ok;
        public What(String ok) {
            this.ok = ok;
        }
    }
    public static void main(String[] args) {
        Logger logger = LogManager.getLogger("fds");
        What ok = new What("wowza");
        logger.info(ok);
    }
}
