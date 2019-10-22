package com.example.log4j2demo;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class Log4j2DemoApplication implements ApplicationRunner {
    private static final Logger logger = LogManager.getLogger(Log4j2DemoApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(Log4j2DemoApplication.class, args);
    }

    @Override
    public void run(ApplicationArguments applicationArguments) throws Exception {
        logger.debug("Debugging log");
        logger.info("Info log");
        logger.warn("Hey, This is a warning!");
        logger.error("Oops! We have an Error. OK");
        logger.fatal("Damn! Fatal error. Please fix me.");
    }

        @RequestMapping("/")
        public String greet(){
        logger.info("Info******Master 日志******log");
        for(int i=0;i<10;i++){ logger.info("日志行: {}",i); }
        return "Success! Master";
    }

        @RequestMapping("/hello")
        public String hello(){
        //mapped to hostname:port/hello/
                logger.info("Info******Master Hello******log");
                for(int i=0;i<10;i++){ logger.info("日志行: Hello, Master{}",i); }
                { logger.warn("日志行: Hello, Master WARNING"); }
                { logger.error("日志行: Hello, Master ERROR"); }
                return "Hello, Master";
        }
}
