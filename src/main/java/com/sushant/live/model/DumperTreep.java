package com.sushant.live.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class DumperTreep {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
//	 @Id
//	 @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "treep_seq")
//	 @SequenceGenerator(name = "treep_seq", sequenceName = "treep_seq", allocationSize = 1)
//	 private int id;
	
	private String selectedVehicle;
	
	private String customerName;
	
	private String diesel;
	
	private String advance;
	
	private String soilBrass;
	
	private String soilRate;
	
	private String	totalPayment;
	
	private String createDate;
	
	private String omobile;
	
	private String item;
	
	private String isBilled;
	
	

	public String getIsBilled() {
		return isBilled;
	}

	public void setIsBilled(String isBilled) {
		this.isBilled = isBilled;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSelectedVehicle() {
		return selectedVehicle;
	}

	public void setSelectedVehicle(String selectedVehicle) {
		this.selectedVehicle = selectedVehicle;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getDiesel() {
		return diesel;
	}

	public void setDiesel(String diesel) {
		this.diesel = diesel;
	}

	public String getAdvance() {
		return advance;
	}

	public void setAdvance(String advance) {
		this.advance = advance;
	}

	public String getSoilBrass() {
		return soilBrass;
	}

	public void setSoilBrass(String soilBrass) {
		this.soilBrass = soilBrass;
	}

	public String getSoilRate() {
		return soilRate;
	}

	public void setSoilRate(String soilRate) {
		this.soilRate = soilRate;
	}

	public String getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(String totalPayment) {
		this.totalPayment = totalPayment;
	}

	
	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	
	public String getOmobile() {
		return omobile;
	}

	public void setOmobile(String omobile) {
		this.omobile = omobile;
	}
	
	

	

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public DumperTreep() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DumperTreep(int id, String selectedVehicle, String customerName, String diesel, String advance,
			String soilBrass, String soilRate, String totalPayment, String createDate, String omobile, String item,
			String isBilled) {
		super();
		this.id = id;
		this.selectedVehicle = selectedVehicle;
		this.customerName = customerName;
		this.diesel = diesel;
		this.advance = advance;
		this.soilBrass = soilBrass;
		this.soilRate = soilRate;
		this.totalPayment = totalPayment;
		this.createDate = createDate;
		this.omobile = omobile;
		this.item = item;
		this.isBilled = isBilled;
	}

}
