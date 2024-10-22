package com.sushant.live.dto;

public class ReadingDTO {
	
	String startReading;
    String endReading;
    String maintenance;
    String disel;
    String driverId;
    String machineNumber;
    String selectedOwnerMobile;
    
	public String getMachineNumber() {
		return machineNumber;
	}
	public void setMachineNumber(String machineNumber) {
		this.machineNumber = machineNumber;
	}
	
	public String getStartReading() {
		return startReading;
	}
	public void setStartReading(String startReading) {
		this.startReading = startReading;
	}
	public String getEndReading() {
		return endReading;
	}
	public void setEndReading(String endReading) {
		this.endReading = endReading;
	}
	public String getMaintenance() {
		return maintenance;
	}
	public void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}
	public String getDisel() {
		return disel;
	}
	public void setDisel(String disel) {
		this.disel = disel;
	}
	public String getDriverId() {
		return driverId;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}
	public String getSelectedOwnerMobile() {
		return selectedOwnerMobile;
	}
	public void setSelectedOwnerMobile(String selectedOwnerMobile) {
		this.selectedOwnerMobile = selectedOwnerMobile;
	}
	public ReadingDTO(String startReading, String endReading, String maintenance,String disel, String driverId,
			String selectedOwnerMobile) {
		super();
		this.startReading = startReading;
		this.endReading = endReading;
		this.maintenance = maintenance;
		this.disel = disel;
		this.driverId = driverId;
		this.selectedOwnerMobile = selectedOwnerMobile;
	}
	public ReadingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ReadingDTO [startReading=" + startReading + ", endReading=" + endReading + ", maintenance="
				+ maintenance + ", driverId=" + driverId + ", selectedOwnerMobile=" + selectedOwnerMobile + "]";
	}
}
