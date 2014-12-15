package lt.wonderb0.example;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ApplicationSetup {
    @Value("${echoservice.greeting:Hello, World!}")
    private String greeting;

    public String getGreeting() {
        return greeting;
    }
}
