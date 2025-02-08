package com.sushant.live.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Column;

@Entity
public class Vehicale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
//	@Id
//	 @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "vehicle_seq")
//	 @SequenceGenerator(name = "vehicle_seq", sequenceName = "vehicle_seq", allocationSize = 1)
//	 private int id;

    @Column(name = "machine_number", length = 10, nullable = false)
    private String machineNumber;

    @Column(name = "company", length = 20, nullable = false)
    private String company;
    
    @Column(name = "v_type", length = 20, nullable = false)
    private String v_type;


    @Column(name = "onwerMobile", nullable = false)
    private String onwerMobile;
    
    // Default constructor
    public Vehicale() {
    }

    // Parameterized constructor
    public Vehicale(int id, String machineNumber, String company, String v_type, String onwerMobile) {
		super();
		this.id = id;
		this.machineNumber = machineNumber;
		this.company = company;
		this.v_type = v_type;
		this.onwerMobile = onwerMobile;
	}

    // Getters and Setters
    public int getId() {
        return id;
    }

    

	public String getV_type() {
		return v_type;
	}

	public void setV_type(String v_type) {
		this.v_type = v_type;
	}

	public String getOnwerMobile() {
		return onwerMobile;
	}

	public void setOnwerMobile(String onwerMobile) {
		this.onwerMobile = onwerMobile;
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

