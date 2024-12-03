package com.sushant.live.dto;

public class PaymentDTO {

	String customer_name ;
	
	String amount;

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public PaymentDTO(String customer_name, String amount) {
		super();
		this.customer_name = customer_name;
		this.amount = amount;
	}

	public PaymentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
