package com.example.springboothelloworld;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Hello World from Spring Boot on ARM64!";
    }

    @GetMapping("/hello")
    public String helloWithName(@RequestParam(value = "name", defaultValue = "World") String name) {
        return String.format("Hello %s from Spring Boot on ARM64!", name);
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }
} 