package com.sushant.live.dto;

public class OrderDTO {
	
	String customer_name ;
	
	String machine_numbers;
	
	String address;
	
	String advance;

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getMachine_numbers() {
		return machine_numbers;
	}

	public void setMachine_numbers(String machine_numbers) {
		this.machine_numbers = machine_numbers;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

	public String getAdvance() {
		return advance;
	}

	public void setAdvance(String advance) {
		this.advance = advance;
	}

	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(String customer_name, String machine_numbers, String address, String advance) {
		super();
		this.customer_name = customer_name;
		this.machine_numbers = machine_numbers;
		this.address = address;
		this.advance = advance;
	}

	
	
	

}
