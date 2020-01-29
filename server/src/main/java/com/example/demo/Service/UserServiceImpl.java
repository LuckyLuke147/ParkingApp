package com.example.demo.Service;

import com.example.demo.Exception.ResourceNotFoundException;
import com.example.demo.Entity.User;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Service.Interface.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
    }

    @Override
    public User addUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public User updateUser(Long userId, User userDetails) {
        User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "userID", userId));

        user.setName(userDetails.getName());
        user.setSurname(userDetails.getSurname());
        user.setE_mail(userDetails.getE_mail());
        user.setPhone_number(userDetails.getPhone_number());
        user.setPassword(userDetails.getPassword());

        User updateUser = userRepository.save(user);
        return updateUser;
    }

    @Override
    public void deleteUser(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "userID", userId));

        userRepository.delete(user);
    }
}
