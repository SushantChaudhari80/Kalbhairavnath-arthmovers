package com.sushant.live.dto;

public class VehicalDTO {
    private String machineNumber;
    private String company;
    private String v_type;
    

    // Constructors
    public VehicalDTO() {}
    
    

    public VehicalDTO(String machineNumber, String company, String v_type) {
		super();
		this.machineNumber = machineNumber;
		this.company = company;
		this.v_type = v_type;
	}



	// Getters and Setters
    
    public String getMachineNumber() {
        return machineNumber;
    }

    public String getV_type() {
		return v_type;
	}



	public void setV_type(String v_type) {
		this.v_type = v_type;
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
