package com.sushant.live.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class VehicaleDriver {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;

    @Column(name = "driverName", length = 255, nullable = false)
    private String driverName;

    @Column(name = "driverMobile", length = 255, nullable = false)
    private String driverMobile;
    
    @Column(name = "driverAddress", length = 255, nullable = false)
    private String driverAddress;
    
    @Column(name = "driverAadhar", length = 255, nullable = false)
    private String driverAadhar;
    
    @Column(name = "driverLiencense", length = 255, nullable = false)
    private String driverLiencense;
    
    @Column(name = "machineNumber", length = 255)
    private String machineNumber;  // Nullable if not assigned yet
    
    @Column(name = "onwerMobile", nullable = false)
    private String onwerMobile;
    
    private String password;
    
    private String createDate;
    
    private String driverSalary;
    
    
    public VehicaleDriver() {
        super();
    }
    
    public VehicaleDriver(int id, String driverName, String driverMobile, String driverAddress, String driverAadhar,
			String driverLiencense, String machineNumber, String onwerMobile, String password, String createDate,
			String driverSalary) {
		super();
		this.id = id;
		this.driverName = driverName;
		this.driverMobile = driverMobile;
		this.driverAddress = driverAddress;
		this.driverAadhar = driverAadhar;
		this.driverLiencense = driverLiencense;
		this.machineNumber = machineNumber;
		this.onwerMobile = onwerMobile;
		this.password = password;
		this.createDate = createDate;
		this.driverSalary = driverSalary;
	}

	public String getDriverSalary() {
		return driverSalary;
	}

	public void setDriverSalary(String driverSalary) {
		this.driverSalary = driverSalary;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverMobile() {
        return driverMobile;
    }

    public void setDriverMobile(String driverMobile) {
        this.driverMobile = driverMobile;
    }

    public String getDriverAddress() {
        return driverAddress;
    }

    public void setDriverAddress(String driverAddress) {
        this.driverAddress = driverAddress;
    }

    public String getDriverAadhar() {
        return driverAadhar;
    }

    public void setDriverAadhar(String driverAadhar) {
        this.driverAadhar = driverAadhar;
    }

    public String getMachineNumber() {
        return machineNumber;
    }

    public void setMachineNumber(String machineNumber) {
        this.machineNumber = machineNumber;
    }

    public String getOwnerMobile() {
        return onwerMobile;
    }

    public void setOwnerMobile(String ownerMobile) {
        this.onwerMobile = ownerMobile;
    }
    
    

    // Optionally override toString, equals, and hashCode

    public String getDriverLiencense() {
		return driverLiencense;
	}

	public void setDriverLiencense(String driverLiencense) {
		this.driverLiencense = driverLiencense;
	}

	public String getOnwerMobile() {
		return onwerMobile;
	}

	public void setOnwerMobile(String onwerMobile) {
		this.onwerMobile = onwerMobile;
	}
	
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
    public String toString() {
        return "VehicleDriver{" +
                "id=" + id +
                ", driverName='" + driverName + '\'' +
                ", driverMobile='" + driverMobile + '\'' +
                ", driverAddress='" + driverAddress + '\'' +
                ", driverAadhar='" + driverAadhar + '\'' +
                ", machineNumber='" + machineNumber + '\'' +
                ", ownerMobile='" + onwerMobile + '\'' +
                '}';
    }
}
