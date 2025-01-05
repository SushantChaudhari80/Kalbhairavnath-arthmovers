package com.sushant.live.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Payment")
public class Payments {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
	
	private String payment_date;
	
	private String customerName;
	
	private String payment;
	
	private String ownerMobile;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getOwnerMobile() {
		return ownerMobile;
	}

	public void setOwnerMobile(String ownerMobile) {
		this.ownerMobile = ownerMobile;
	}

	public Payments(int id, String payment_date, String customerName, String payment, String ownerMobile) {
		super();
		this.id = id;
		this.payment_date = payment_date;
		this.customerName = customerName;
		this.payment = payment;
		this.ownerMobile = ownerMobile;
	}

	public Payments() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Payments [id=" + id + ", payment_date=" + payment_date + ", customerName=" + customerName + ", payment="
				+ payment + ", ownerMobile=" + ownerMobile + "]";
	}
	

}
