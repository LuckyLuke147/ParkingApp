package com.example.demo.Service.Interface;

import com.example.demo.Entity.Place;

import java.util.List;

public interface PlaceService {

    public List<Place> getAllPlaces();

    public Place getPlaceById(Long placeId);
}
