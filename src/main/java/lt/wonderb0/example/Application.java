package lt.wonderb0.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan
@EnableAutoConfiguration
public class Application {
    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private ApplicationSetup setup;

    @Bean
    public String greetingTemplate() {
        return setup.getGreetingTemplate(); // TODO: There surely is a less convoluted way to expose this @Value
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
