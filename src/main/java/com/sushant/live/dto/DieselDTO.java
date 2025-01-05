package com.sushant.live.dto;

public class DieselDTO {
	
	 private String vehicleNumber;
	 private String fuelInLtr;
	 private String petrolPump;
	 private String rate;
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	public String getFuelInLtr() {
		return fuelInLtr;
	}
	public void setFuelInLtr(String fuelInLtr) {
		this.fuelInLtr = fuelInLtr;
	}
	public String getPetrolPump() {
		return petrolPump;
	}
	public void setPetrolPump(String petrolPump) {
		this.petrolPump = petrolPump;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public DieselDTO(String vehicleNumber, String fuelInLtr, String petrolPump, String rate) {
		super();
		this.vehicleNumber = vehicleNumber;
		this.fuelInLtr = fuelInLtr;
		this.petrolPump = petrolPump;
		this.rate = rate;
	}
	public DieselDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "DieselDTO [vehicleNumber=" + vehicleNumber + ", fuelInLtr=" + fuelInLtr + ", petrolPump=" + petrolPump
				+ ", rate=" + rate + "]";
	}

	 
}
