package com.sushant.live.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Lob;

public class ReadingDTO {
    private byte[] startReading;
   // private MultipartFile startReading; 
    private byte[] endReading;
  //  private MultipartFile endReading;  
    private byte[] disel;
    //private MultipartFile disel;      
    private String maintenance;
    private String driverId;
    private String machineNumber;
    private String selectedOwnerMobile;
	public byte[] getStartReading() {
		return startReading;
	}
	public void setStartReading(byte[] startReading) {
		this.startReading = startReading;
	}
	public byte[] getEndReading() {
		return endReading;
	}
	public void setEndReading(byte[] endReading) {
		this.endReading = endReading;
	}
	public byte[] getDisel() {
		return disel;
	}
	public void setDisel(byte[] disel) {
		this.disel = disel;
	}
	public String getMaintenance() {
		return maintenance;
	}
	public void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}
	public String getDriverId() {
		return driverId;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}
	public String getMachineNumber() {
		return machineNumber;
	}
	public void setMachineNumber(String machineNumber) {
		this.machineNumber = machineNumber;
	}
	public String getSelectedOwnerMobile() {
		return selectedOwnerMobile;
	}
	public void setSelectedOwnerMobile(String selectedOwnerMobile) {
		this.selectedOwnerMobile = selectedOwnerMobile;
	}
	public ReadingDTO(byte[] startReading, byte[] endReading, byte[] disel, String maintenance, String driverId,
			String machineNumber, String selectedOwnerMobile) {
		super();
		this.startReading = startReading;
		this.endReading = endReading;
		this.disel = disel;
		this.maintenance = maintenance;
		this.driverId = driverId;
		this.machineNumber = machineNumber;
		this.selectedOwnerMobile = selectedOwnerMobile;
	}
	public ReadingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ReadingDTO [startReading=" + Arrays.toString(startReading) + ", endReading="
				+ Arrays.toString(endReading) + ", disel=" + Arrays.toString(disel) + ", maintenance=" + maintenance
				+ ", driverId=" + driverId + ", machineNumber=" + machineNumber + ", selectedOwnerMobile="
				+ selectedOwnerMobile + "]";
	}
    
   
}
