package com.sushant.live.mapper;

public class PaymentHistoryMapper {
	
	int id;
	
	String date;
	
	String customer_name;
	
	String v_number;
	
	String total;
	
	String rate;
	
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

	public String getV_number() {
		return v_number;
	}

	public void setV_number(String v_number) {
		this.v_number = v_number;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getTotal_payment() {
		return total_payment;
	}

	public void setTotal_payment(String total_payment) {
		this.total_payment = total_payment;
	}

	

	public PaymentHistoryMapper(int id, String date, String customer_name, String v_number, String total, String rate,
			String total_payment) {
		super();
		this.id = id;
		this.date = date;
		this.customer_name = customer_name;
		this.v_number = v_number;
		this.total = total;
		this.rate = rate;
		this.total_payment = total_payment;
	}

	public PaymentHistoryMapper() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
