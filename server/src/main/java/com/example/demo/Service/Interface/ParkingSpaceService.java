package com.example.demo.Service.Interface;

import com.example.demo.Entity.ParkingSpace;

import java.util.List;

public interface ParkingSpaceService {

    public List<ParkingSpace> getAllParkingSpaces();

    public ParkingSpace getParkingSpaceById(Long parkingSpaceId);

    public ParkingSpace addParkingSpace(ParkingSpace parkingSpace);

    public ParkingSpace updateParkingSpace(Long parkingSpaceId, ParkingSpace parkingSpaceDetails);

    public void deleteParkingSpace(Long parkingSpaceId);
}
