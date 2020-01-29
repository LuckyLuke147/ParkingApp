package com.example.demo.Service;

import com.example.demo.Exception.ResourceNotFoundException;
import com.example.demo.Entity.Vehicle;
import com.example.demo.Repository.VehicleRepository;
import com.example.demo.Service.Interface.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    VehicleRepository vehicleRepository;

    @Override
    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    @Override
    public Vehicle getVehicleById(Long vehicleId) {
        return vehicleRepository.findById(vehicleId).orElseThrow(() -> new ResourceNotFoundException("Vehicle", "id", vehicleId));
    }

    @Override
    public Vehicle addVehicle(Vehicle vehicle) {
        return vehicleRepository.save(vehicle);
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
    public void deleteVehicle(Long vehicleId) {
        Vehicle user = vehicleRepository.findById(vehicleId).orElseThrow(() -> new ResourceNotFoundException("Vehicle", "vehicleID", vehicleId));

        vehicleRepository.delete(user);
    }
}
