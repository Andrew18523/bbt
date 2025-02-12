package com.bbtaxiex.demo_section1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.bbtaxiex.demo_section1.entity.User;
import com.bbtaxiex.demo_section1.repository.UserRepository;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/users")
public class UserController {
  
  @Autowired
    private UserRepository userRepository;

  @PostMapping
    public ResponseEntity<String> createUser(@Valid @RequestBody User user) {
        userRepository.save(user);
        return new ResponseEntity<>("User created successfully!", HttpStatus.CREATED);
    }

}
