package com.example.demo.Service;

import com.example.demo.Entity.*;
import com.example.demo.Exception.ResourceNotFoundException;
import com.example.demo.Repository.PlaceRepository;
import com.example.demo.Repository.ReservationRepository;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Repository.VehicleRepository;
import com.example.demo.Service.Interface.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    UserRepository userRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    VehicleRepository vehicleRepository;

    @Autowired
    PlaceRepository placeRepository;


    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
    }

    @Override
    public User addUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public User updateUser(Long userId, User userDetails) {
        User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "userID", userId));

        user.setName(userDetails.getName());
        user.setSurname(userDetails.getSurname());
        user.setE_mail(userDetails.getE_mail());
        user.setPhone_number(userDetails.getPhone_number());
        user.setPassword(userDetails.getPassword());

        return userRepository.save(user);
    }

    @Override
    public void deleteUser(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "userID", userId));

        userRepository.delete(user);
    }

    @Override
    public Optional<User> signIn(User user) {
        User example = new User();
        example.setE_mail(user.getE_mail());
        example.setPassword(user.getPassword());
        return userRepository.findOne(Example.of(example));
    }

    @Override
    public Reservation addReservation(Long userId, Reservation reservation) {
        User user = userRepository.findById(userId).get();


        if (user.getReservation() != null) {
            throw new RuntimeException("Uzytkownik ma rezerwacje");
        }

        Optional<Vehicle> vehicle = vehicleRepository.findById(reservation.getVehicleId());
        reservation.setVehicle(vehicle.get());
        Optional<Place> place = placeRepository.findById(reservation.getPlaceId());
        ParkingSpace selectedSpace = null;
        for (ParkingSpace space : place.get().getParking_space()) {
            if (space.isFree()) {
                selectedSpace = space;
            }
        }
        if(selectedSpace == null) {
            throw new RuntimeException("Brak wolnych miejsc");
        }
        reservation.setSpaceId(selectedSpace.getId());
        selectedSpace.setFree(false);

        reservation.setUser(user);

        reservationRepository.save(reservation);
        logger.info("Reservation created.");
        return reservation;
    }

    public List<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }
}


