package com.sushant.live.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "machinereading")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class MachineReading {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
	
	private String date ;
	
	private String startReading ;
	
	private String endReading;
	
	private String Maintenance;
	
	private String onwerMobile;
	
	private String driverName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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
		return Maintenance;
	}

	public void setMaintenance(String maintenance) {
		Maintenance = maintenance;
	}

	public String getOnwerMobile() {
		return onwerMobile;
	}

	public void setOnwerMobile(String onwerMobile) {
		this.onwerMobile = onwerMobile;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public MachineReading(int id, String date, String startReading, String endReading, String maintenance,
			String onwerMobile, String driverName) {
		super();
		this.id = id;
		this.date = date;
		this.startReading = startReading;
		this.endReading = endReading;
		Maintenance = maintenance;
		this.onwerMobile = onwerMobile;
		this.driverName = driverName;
	}

	public MachineReading() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
