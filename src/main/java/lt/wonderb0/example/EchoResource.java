package lt.wonderb0.example;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * A very simple resource which greets the user with a hard-coded string.
 */
@RestController
public class EchoResource {
    @Resource
    private String greetingTemplate;

    @RequestMapping("/greet/{whom}")
    public String greet(@PathVariable("whom") String whom) {
        return greetingTemplate.replace("_whom_", whom);
    }
}
