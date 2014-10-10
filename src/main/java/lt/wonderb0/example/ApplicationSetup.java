package lt.wonderb0.example;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ApplicationSetup {
    @Value("${echoservice.greetingTemplate:Hello there, _whom_!}")
    private String greetingTemplate;

    public String getGreetingTemplate() {
        return greetingTemplate;
    }
}
