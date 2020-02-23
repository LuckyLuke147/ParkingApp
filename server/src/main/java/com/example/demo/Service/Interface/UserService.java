package com.example.demo.Service.Interface;

import com.example.demo.Entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    public List<User> getAllUsers();

    public User getUserById(Long userId);

    public User addUser(User user);

    public User updateUser(Long userId, User userDetails);

    public void deleteUser(Long userId);

    public Optional<User> signIn(User user);
}
