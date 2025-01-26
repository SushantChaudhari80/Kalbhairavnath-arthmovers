package com.sushant.live.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "vouchers")
public class Vouchers {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
	
	String MachineNumber;
	String DriverName;
	String amount;
	String createDate;
	String Comment;
	String oNumber;
	
	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getMachineNumber() {
		return MachineNumber;
	}



	public void setMachineNumber(String machineNumber) {
		MachineNumber = machineNumber;
	}



	public String getDriverName() {
		return DriverName;
	}



	public void setDriverName(String driverName) {
		DriverName = driverName;
	}



	public String getAmount() {
		return amount;
	}



	public void setAmount(String amount) {
		this.amount = amount;
	}



	public String getCreateDate() {
		return createDate;
	}



	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}



	public String getComment() {
		return Comment;
	}



	public void setComment(String comment) {
		Comment = comment;
	}



	public String getoNumber() {
		return oNumber;
	}



	public void setoNumber(String oNumber) {
		this.oNumber = oNumber;
	}

    

	public Vouchers(int id, String machineNumber, String driverName, String amount, String createDate, String comment,
			String oNumber) {
		super();
		this.id = id;
		MachineNumber = machineNumber;
		DriverName = driverName;
		this.amount = amount;
		this.createDate = createDate;
		Comment = comment;
		this.oNumber = oNumber;
	}



	public Vouchers() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
