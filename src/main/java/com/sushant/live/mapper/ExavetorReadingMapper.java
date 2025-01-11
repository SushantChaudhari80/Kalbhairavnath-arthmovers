package com.sushant.live.mapper;

public class ExavetorReadingMapper {

	int id; 
	String date; 
	String customer_name;
	String machine_number;
	String start_reading;
	String end_reding;
	String total_payment;
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
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getMachine_number() {
		return machine_number;
	}
	public void setMachine_number(String machine_number) {
		this.machine_number = machine_number;
	}
	public String getStart_reading() {
		return start_reading;
	}
	public void setStart_reading(String start_reading) {
		this.start_reading = start_reading;
	}
	public String getEnd_reding() {
		return end_reding;
	}
	public void setEnd_reding(String end_reding) {
		this.end_reding = end_reding;
	}
	public String getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(String total_payment) {
		this.total_payment = total_payment;
	}
	public ExavetorReadingMapper(int id, String date, String customer_name, String machine_number, String start_reading,
			String end_reding, String total_payment) {
		super();
		this.id = id;
		this.date = date;
		this.customer_name = customer_name;
		this.machine_number = machine_number;
		this.start_reading = start_reading;
		this.end_reding = end_reding;
		this.total_payment = total_payment;
	}
	public ExavetorReadingMapper() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
