package com.example.demo.Service;

import com.example.demo.Entity.ParkingSpace;
import com.example.demo.Exception.ResourceNotFoundException;
import com.example.demo.Repository.ParkingSpaceRepository;
import com.example.demo.Service.Interface.ParkingSpaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParkingSpaceServiceImpl implements ParkingSpaceService {

    @Autowired
    ParkingSpaceRepository parkingSpaceRepository;

    @Override
    public List<ParkingSpace> getAllParkingSpaces() {
        return parkingSpaceRepository.findAll();
    }

    @Override
    public ParkingSpace getParkingSpaceById(Long parkingSpaceId) {
        return parkingSpaceRepository.findById(parkingSpaceId).orElseThrow(() -> new ResourceNotFoundException("ParkingSpace", "id", parkingSpaceId));
    }

    @Override
    public ParkingSpace addParkingSpace(ParkingSpace parkingSpace) {
        return parkingSpaceRepository.save(parkingSpace);
    }

    @Override
    public ParkingSpace updateParkingSpace(Long parkingSpaceId, ParkingSpace parkingSpaceDetails) {
        ParkingSpace parkingSpace = parkingSpaceRepository.findById(parkingSpaceId).orElseThrow(() -> new ResourceNotFoundException("ParkingSpace", "parkingSpaceID", parkingSpaceId));

        parkingSpace.setPosition(parkingSpaceDetails.getPosition());
        parkingSpace.setFree(parkingSpaceDetails.isFree());


        ParkingSpace updateParkingSpace = parkingSpaceRepository.save(parkingSpace);
        return updateParkingSpace;
    }

    @Override
    public void deleteParkingSpace(Long parkingSpaceId) {
        ParkingSpace parkingSpace = parkingSpaceRepository.findById(parkingSpaceId).orElseThrow(() -> new ResourceNotFoundException("ParkingSpace", "parkingSpaceID", parkingSpaceId));

        parkingSpaceRepository.delete(parkingSpace);
    }
}
