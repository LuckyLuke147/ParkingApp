package com.example.demo.Controller;

import com.example.demo.Entity.User;
import com.example.demo.Entity.Vehicle;
import com.example.demo.Service.VehicleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/vehicles")
public class VehicleContoller {

    @Autowired
    VehicleServiceImpl vehicleServiceImpl;

    @GetMapping
    public List<Vehicle> getAllVehicles() {
        return vehicleServiceImpl.getAllVehicles();
    }

//    @GetMapping("/{id}")
//    public Vehicle getVehicleById(@PathVariable(value = "id") Long vehicleId) {
//        return vehicleServiceImpl.getVehicleById(vehicleId);
//    }

//    @PostMapping
//    public Vehicle addVehicle(@RequestBody Vehicle vehicle) {
//        return vehicleServiceImpl.addVehicle(vehicle);
//    }

//    @PutMapping("/{id}")
//    public Vehicle updateVehicle(@PathVariable(value = "id") Long vehicleId, @RequestBody Vehicle vehicleDetails) {
//        return vehicleServiceImpl.updateVehicle(vehicleId, vehicleDetails);
//    }

//    @DeleteMapping("/{id}")
//    public void deleteVehicle(@PathVariable(value = "id") Long vehicleId) {
//        vehicleServiceImpl.deleteVehicle(vehicleId);
//    }
}