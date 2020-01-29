package com.example.demo.Service;

import com.example.demo.Entity.Place;
import com.example.demo.Exception.ResourceNotFoundException;
import com.example.demo.Repository.PlaceRepository;
import com.example.demo.Service.Interface.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceServiceImpl implements PlaceService {

    @Autowired
    PlaceRepository placeRepository;

    @Override
    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }

    @Override
    public Place getPlaceById(Long placeId) {
        return placeRepository.findById(placeId).orElseThrow(() -> new ResourceNotFoundException("Place", "id", placeId));
    }
}
