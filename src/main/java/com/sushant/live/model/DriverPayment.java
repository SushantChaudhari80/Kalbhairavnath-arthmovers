package com.sushant.live.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "DriverPayment")
public class DriverPayment {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
	
	@Column(name = "payment_date")
	private String payment_date ;
	
	private String amount ;
	
	private String driverName ;
	
	private String comment;
	
	private String transaction;
	
	private String onwerMobile ;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return payment_date;
	}

	public void setDate(String date) {
		this.payment_date = date;
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
	
	

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	
	

	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	

	public DriverPayment(int id, String payment_date, String amount, String driverName, String comment,
			String transaction, String onwerMobile) {
		super();
		this.id = id;
		this.payment_date = payment_date;
		this.amount = amount;
		this.driverName = driverName;
		this.comment = comment;
		this.transaction = transaction;
		this.onwerMobile = onwerMobile;
	}

	public DriverPayment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
