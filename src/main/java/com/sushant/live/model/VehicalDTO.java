package com.sushant.live.model;

public class VehicalDTO {
    private String machineNumber;
    private String company;

    // Constructors
    public VehicalDTO() {}
    
    public VehicalDTO(String machineNumber, String company) {
        this.machineNumber = machineNumber;
        this.company = company;
    }

    // Getters and Setters
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
}
