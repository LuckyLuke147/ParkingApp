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
}