package com.example.demo.Service;

import com.example.demo.Entity.User;
import com.example.demo.Exception.ResourceNotFoundException;
import com.example.demo.Entity.Vehicle;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Repository.VehicleRepository;
import com.example.demo.Service.Interface.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    VehicleRepository vehicleRepository;

    @Autowired
    UserRepository userRepository;

    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    @Override
    public Optional<Vehicle> getVehicleById(Long vehicleId) {
        if (!vehicleRepository.existsById(vehicleId)) {
            throw new ResourceNotFoundException("Vehicle", "id", vehicleId);
        }
        return vehicleRepository.findById(vehicleId);
    }


    @Override
    public Vehicle addVehicle(Long userId, Vehicle vehicle) {
        Set<Vehicle> vehicles = new HashSet<>();
        User user1 = new User();

        Optional<User> byId = userRepository.findById(userId);
        if (!byId.isPresent()) {
            throw new ResourceNotFoundException("User", "id", userId);
        }
        User user = byId.get();

        //tie User to Vehicle
        vehicle.setUser(user);

        Vehicle vehicle1 = vehicleRepository.save(vehicle);

        //tie Vehicle to User
        vehicles.add(vehicle1);

        user1.setVehicles(vehicles);

        return vehicle1;
    }

    @Override
    public Vehicle updateVehicle(Long vehicleId, Vehicle vehicleDetails) {
        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElseThrow(() -> new ResourceNotFoundException("Vehicle", "vehicleID", vehicleId));

        vehicle.setBrand(vehicleDetails.getBrand());
        vehicle.setModel(vehicleDetails.getModel());
        vehicle.setRegistration_no(vehicleDetails.getRegistration_no());

        Vehicle updateVehicle = vehicleRepository.save(vehicle);
        return updateVehicle;
    }

    @Override
    public ResponseEntity<Object> deleteVehicle(Long vehicleId) {
        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElseThrow(() -> new ResourceNotFoundException("Vehicle", "vehicleID", vehicleId));

        Optional<User> byId = userRepository.findById(vehicle.getUserId());
        if (byId.isPresent()) {
            User user = byId.get();
            user.getVehicles().removeIf(v -> (
                    v.getId().equals(vehicle.getId())));
        }


        vehicleRepository.delete(vehicle);

        return ResponseEntity.ok().build();
    }
}
