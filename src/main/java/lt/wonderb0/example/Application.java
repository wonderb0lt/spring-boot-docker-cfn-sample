package lt.wonderb0.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Configuration
@ComponentScan
@Controller
@EnableAutoConfiguration
public class Application {
    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private ApplicationSetup setup;

    @RequestMapping("/hello")
    @ResponseBody
    public String sayHello() {
        return setup.getGreeting();
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
