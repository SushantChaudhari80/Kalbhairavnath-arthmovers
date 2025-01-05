package com.sushant.live.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PaymentDTO {

	 @JsonProperty("customerName")
	String customerName ;
	
	String amount;

	public String getCustomer_name() {
		return customerName;
	}

	public void setCustomer_name(String customer_name) {
		this.customerName = customer_name;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public PaymentDTO(String customer_name, String amount) {
		super();
		this.customerName = customer_name;
		this.amount = amount;
	}

	public PaymentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "PaymentDTO [customerName=" + customerName + ", amount=" + amount + "]";
	}
	
	
	
}
