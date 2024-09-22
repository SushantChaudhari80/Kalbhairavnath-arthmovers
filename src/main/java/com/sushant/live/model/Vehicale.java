package com.sushant.live.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column;

@Entity
public class Vehicale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;

    @Column(name = "machine_number", length = 10, nullable = false)
    private String machineNumber;

    @Column(name = "company", length = 20, nullable = false)
    private String company;

    // Default constructor
    public Vehicale() {
    }

    // Parameterized constructor
    public Vehicale(String machineNumber, String company) {
        this.machineNumber = machineNumber;
        this.company = company;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMachineNumber() {
        return machineNumber;
    }

    public void setMachineNumber(String machineNumber) {
        this.machineNumber = machineNumber;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "Vehicale{" +
                "id=" + id +
                ", machineNumber='" + machineNumber + '\'' +
                ", company='" + company + '\'' +
                '}';
    }
}

