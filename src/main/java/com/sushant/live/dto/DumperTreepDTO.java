package com.sushant.live.dto;

public class DumperTreepDTO {
	
     String selectedVehicle;
	
	 String customerName;
	
	 String diesel;
	
	 String advance;
	
	 String soilBrass;
	
	 String soilRate;
	
	 String	totalPayment;
	 
	 String item;

	public DumperTreepDTO(String selectedVehicle, String customerName, String diesel, String advance, String soilBrass,
			String soilRate, String totalPayment, String item) {
		super();
		this.selectedVehicle = selectedVehicle;
		this.customerName = customerName;
		this.diesel = diesel;
		this.advance = advance;
		this.soilBrass = soilBrass;
		this.soilRate = soilRate;
		this.totalPayment = totalPayment;
		this.item = item;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public DumperTreepDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSelectedVehicle() {
		return selectedVehicle;
	}

	public void setSelectedVehicle(String selectedVehicle) {
		this.selectedVehicle = selectedVehicle;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getDiesel() {
		return diesel;
	}

	public void setDiesel(String diesel) {
		this.diesel = diesel;
	}

	public String getAdvance() {
		return advance;
	}

	public void setAdvance(String advance) {
		this.advance = advance;
	}

	public String getSoilBrass() {
		return soilBrass;
	}

	@Override
	public String toString() {
		return "DumperTreepDTO [selectedVehicle=" + selectedVehicle + ", customerName=" + customerName + ", diesel="
				+ diesel + ", advance=" + advance + ", soilBrass=" + soilBrass + ", soilRate=" + soilRate
				+ ", totalPayment=" + totalPayment + "]";
	}

	public void setSoilBrass(String soilBrass) {
		this.soilBrass = soilBrass;
	}

	public String getSoilRate() {
		return soilRate;
	}

	public void setSoilRate(String soilRate) {
		this.soilRate = soilRate;
	}

	public String getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(String totalPayment) {
		this.totalPayment = totalPayment;
	}
	
}
