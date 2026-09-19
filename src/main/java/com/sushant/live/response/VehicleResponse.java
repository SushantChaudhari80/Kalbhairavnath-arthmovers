package com.sushant.live.response;

public class VehicleResponse {
	
	private int vehicle_id;
	
    private String machine_number;

    private String company;
    
    private String v_type;
    
    private String driver_names;

	public int getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(int vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	public String getMachine_number() {
		return machine_number;
	}

	public void setMachine_number(String machine_number) {
		this.machine_number = machine_number;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getV_type() {
		return v_type;
	}

	public void setV_type(String v_type) {
		this.v_type = v_type;
	}

	public String getDriver_names() {
		return driver_names;
	}

	public void setDriver_names(String driver_names) {
		this.driver_names = driver_names;
	}

	public VehicleResponse(int vehicle_id, String machine_number, String company, String v_type, String driver_names) {
		super();
		this.vehicle_id = vehicle_id;
		this.machine_number = machine_number;
		this.company = company;
		this.v_type = v_type;
		this.driver_names = driver_names;
	}

	public VehicleResponse() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    

}
