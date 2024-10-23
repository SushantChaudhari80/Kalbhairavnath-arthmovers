package com.sushant.live.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "DriverPayment")
public class DriverPayment {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
	
	private String date ;
	
	private String amount ;
	
	private String driverName ;
	
	private String onwerMobile ;

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

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getOnwerMobile() {
		return onwerMobile;
	}

	public void setOnwerMobile(String onwerMobile) {
		this.onwerMobile = onwerMobile;
	}

	public DriverPayment(int id, String date, String amount, String driverName, String onwerMobile) {
		super();
		this.id = id;
		this.date = date;
		this.amount = amount;
		this.driverName = driverName;
		this.onwerMobile = onwerMobile;
	}

	public DriverPayment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
