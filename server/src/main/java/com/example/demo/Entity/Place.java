package com.example.demo.Entity;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.List;

@Entity
@Table(name = "Place")
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @NotEmpty
    @Column(name = "city")
    private String city;

    @NotEmpty
    @Column(name = "street")
    private String street;

    @NotEmpty
    @Column(name = "building_no")
    private String building_no;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "place", cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private List<ParkingSpace> parking_space;

    //private

    public Place() {
    }

    public Place(@NotEmpty String city, @NotEmpty String street, @NotEmpty String building_no) {
        this.city = city;
        this.street = street;
        this.building_no = building_no;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getBuilding_no() {
        return building_no;
    }

    public void setBuilding_no(String building_no) {
        this.building_no = building_no;
    }

    public List<ParkingSpace> getParking_space() {
        return parking_space;
    }

    public void setParking_space(List<ParkingSpace> parking_space) {
        this.parking_space = parking_space;
    }
}
