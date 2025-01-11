package com.sushant.live.mapper;

public class DumperTreepMapper {

	int id; 
	String date; 
	String customer_name;
	String selected_vehicle;
	String soil_brass;
	String soil_rate;
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
	public String getSelected_vehicle() {
		return selected_vehicle;
	}
	public void setSelected_vehicle(String selected_vehicle) {
		this.selected_vehicle = selected_vehicle;
	}
	public String getSoil_brass() {
		return soil_brass;
	}
	public void setSoil_brass(String soil_brass) {
		this.soil_brass = soil_brass;
	}
	public String getSoil_rate() {
		return soil_rate;
	}
	public void setSoil_rate(String soil_rate) {
		this.soil_rate = soil_rate;
	}
	public String getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(String total_payment) {
		this.total_payment = total_payment;
	}
	public DumperTreepMapper(int id, String date, String customer_name, String selected_vehicle, String soil_brass,
			String soil_rate, String total_payment) {
		super();
		this.id = id;
		this.date = date;
		this.customer_name = customer_name;
		this.selected_vehicle = selected_vehicle;
		this.soil_brass = soil_brass;
		this.soil_rate = soil_rate;
		this.total_payment = total_payment;
	}
	public DumperTreepMapper() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
