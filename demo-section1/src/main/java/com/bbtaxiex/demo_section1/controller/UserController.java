package com.bbtaxiex.demo_section1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import com.bbtaxiex.demo_section1.entity.User;
import com.bbtaxiex.demo_section1.repository.UserRepository;


@RestController
@RequestMapping("/users")
public class UserController {
  
  @Autowired
    private UserRepository userRepository;

  @PostMapping
  @ResponseStatus(HttpStatus.ACCEPTED)
  public String createUser(@RequestBody User user) {
        userRepository.save(user);
        return "User created successfully!";
    }

}
