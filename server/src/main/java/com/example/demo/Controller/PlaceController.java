package com.example.demo.Controller;


import com.example.demo.Entity.Place;
import com.example.demo.Service.PlaceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/places")
public class PlaceController {

    @Autowired
    PlaceServiceImpl placeServiceImpl;

    @GetMapping
    public List<Place> getAllPlaces() {
        return placeServiceImpl.getAllPlaces();
    }

    @GetMapping("/{id}")
    public Place getPlaceById(@PathVariable(value = "id") Long placeId) {
        return placeServiceImpl.getPlaceById(placeId);
    }
}
