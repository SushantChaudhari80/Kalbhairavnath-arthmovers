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

    @Column(name = "onwerMobile", nullable = false)
    private String onwerMobile;
    
    // Default constructor
    public Vehicale() {
    }

    // Parameterized constructor
    public Vehicale(String machineNumber, String company , String onwer_mobile) {
        this.machineNumber = machineNumber;
        this.company = company;
        this.onwerMobile = onwer_mobile;
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

    public String getOnwer_mobile() {
		return onwerMobile;
	}

	public void setOnwer_mobile(String onwer_mobile) {
		this.onwerMobile = onwer_mobile;
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

