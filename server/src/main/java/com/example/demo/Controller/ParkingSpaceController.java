package com.example.demo.Controller;


import com.example.demo.Entity.ParkingSpace;
import com.example.demo.Service.ParkingSpaceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/parking")
public class ParkingSpaceController {

    @Autowired
    ParkingSpaceServiceImpl parkingSpaceServiceImpl;

    @GetMapping
    public List<ParkingSpace> getAllParkingSpaces() {
        return parkingSpaceServiceImpl.getAllParkingSpaces();
    }

    @GetMapping("/{id}")
    public ParkingSpace getParkingSpaceById(@PathVariable(value = "id") Long parkingSpaceId) {
        return parkingSpaceServiceImpl.getParkingSpaceById(parkingSpaceId);
    }

    @PostMapping
    public ParkingSpace addParkingSpace(@RequestBody ParkingSpace parkingSpace) {
        return parkingSpaceServiceImpl.addParkingSpace(parkingSpace);
    }

    @PutMapping("/{id}")
    public ParkingSpace updateParkingSpace(@PathVariable(value = "id") Long parkingSpaceId, @RequestBody ParkingSpace parkingSpaceDetails) {
        return parkingSpaceServiceImpl.updateParkingSpace(parkingSpaceId, parkingSpaceDetails);
    }

    @DeleteMapping("/{id}")
    public void deleteParkingSpace(@PathVariable(value = "id") Long parkingSpaceId) {
        parkingSpaceServiceImpl.deleteParkingSpace(parkingSpaceId);
    }
}
