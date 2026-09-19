package com.sushant.live.dto;

public class DriverDTO {
	
	private String driverName ;
	private String driverMobile ;
	private String driverAddress ; 
	private String driverAadhar ;
	private String driverLiecense;
	private String driverSalary;
	
	
	public String getDriverSalary() {
		return driverSalary;
	}
	public void setDriverSalary(String driverSalary) {
		this.driverSalary = driverSalary;
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
	
	public String getDriverLiecense() {
		return driverLiecense;
	}
	public void setDriverLiecense(String driverLiecense) {
		this.driverLiecense = driverLiecense;
	}
	
	public DriverDTO(String driverName, String driverMobile, String driverAddress, String driverAadhar,
			String driverLiecense, String driverSalary) {
		super();
		this.driverName = driverName;
		this.driverMobile = driverMobile;
		this.driverAddress = driverAddress;
		this.driverAadhar = driverAadhar;
		this.driverLiecense = driverLiecense;
		this.driverSalary = driverSalary;
	}
	public DriverDTO() {
		super();
		// TODO Auto-generated constructor stub
	} 
	
	

}
