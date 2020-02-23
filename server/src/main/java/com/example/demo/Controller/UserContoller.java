package com.example.demo.Controller;

import com.example.demo.Entity.User;
import com.example.demo.Entity.Vehicle;
import com.example.demo.Service.UserServiceImpl;
import com.example.demo.Service.VehicleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/users")
public class UserContoller {

    @Autowired
    UserServiceImpl userServiceImpl;

    @Autowired
    VehicleServiceImpl vehicleServiceImpl;

    @GetMapping
    public List<User> getAllUsers() {
        return userServiceImpl.getAllUsers();
    }

    @GetMapping("/{id}")
    public User getUserById(@PathVariable(value = "id") Long userId) {
        return userServiceImpl.getUserById(userId);
    }

    @PostMapping("/signin")
    public User signIn(@RequestBody User user) {
        Optional<User> signedIn = userServiceImpl.signIn(user);
        if (!signedIn.isPresent()) {
            throw new UserNotFoundException();
        }
        return signedIn.get();
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


    //Vehicle
    @GetMapping(value = "/vehicle/{vehicleId}")
    public Optional<Vehicle> getVehicleById(@PathVariable(value = "vehicleId") Long vehicleId) {
        return vehicleServiceImpl.getVehicleById(vehicleId);
    }

    @PostMapping("/{userId}/vehicle")
    public Vehicle addVehicleByUser(@PathVariable(value = "userId") Long userId, @RequestBody Vehicle vehicle) {
        return vehicleServiceImpl.addVehicle(userId, vehicle);
    }

    @DeleteMapping(value = "/vehicle/{vehicleId}")
    public ResponseEntity<Object> deleteBookById(@PathVariable(value = "vehicleId") long vehicleId) {
        return vehicleServiceImpl.deleteVehicle(vehicleId);
    }

    @ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "User not found")
    public class UserNotFoundException extends RuntimeException {
    }
}


