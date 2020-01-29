package com.example.demo.Service.Interface;

import com.example.demo.Entity.Vehicle;

import java.util.List;

public interface VehicleService {
    public List<Vehicle> getAllVehicles();

    public Vehicle getVehicleById(Long vehicleId);

    public Vehicle addVehicle(Vehicle vehicle);

    public Vehicle updateVehicle(Long vehicleId, Vehicle vehicleDetails);

    public void deleteVehicle(Long vehicleId);
}