package com.example.demo.Controller;

import com.example.demo.Entity.User;
import com.example.demo.Service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserContoller {

    @Autowired
    UserServiceImpl userServiceImpl;

    @GetMapping
    public List<User> getAllUsers() {
        return userServiceImpl.getAllUsers();
    }

    @GetMapping("/{id}")
    public User getUserById(@PathVariable(value = "id") Long userId) {
        return userServiceImpl.getUserById(userId);
    }

    @PostMapping
    public User addUser(@RequestBody User user) {
        return userServiceImpl.addUser(user);
    }

    @PutMapping("/{id}")
    public User updateUser(@PathVariable(value = "id") Long userId, @RequestBody User userDetails) {
        return userServiceImpl.updateUser(userId, userDetails);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable(value = "id") Long userId) {
        userServiceImpl.deleteUser(userId);
    }

}
