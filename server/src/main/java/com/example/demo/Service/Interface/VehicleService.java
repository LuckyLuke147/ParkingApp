package com.example.demo.Service.Interface;

import com.example.demo.Entity.Vehicle;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Optional;

public interface VehicleService {
    public List<Vehicle> getAllVehicles();

    public Optional<Vehicle> getVehicleById(Long bookId);

    public Vehicle addVehicle(Long userId, Vehicle vehicle);

    public Vehicle updateVehicle(Long vehicleId, Vehicle vehicleDetails);

    public ResponseEntity<Object> deleteVehicle(Long vehicleId);
}