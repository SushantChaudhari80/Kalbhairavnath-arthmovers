package com.sushant.live.model;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Lob;
import jakarta.persistence.SequenceGenerator;

@Entity
@Table(name = "machinereading")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class MachineReading {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;
//	@Id
//	 @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reading_seq")
//	 @SequenceGenerator(name = "reading_seq", sequenceName = "reading_seq", allocationSize = 1)
//	 private int id;
//	
	@Column(name = "reading_date")
	private String reading_date ;
	
	@Lob  // Marking this as a large object
   // @Column(name = "startReadingImg", columnDefinition = "MEDIUMBLOB")
    private byte[] startReadingImg;  // Field to store image data
	
	private String startReading;
	
	@Lob  // Marking this as a large object
  //  @Column(name = "endReadingImg", columnDefinition = "MEDIUMBLOB")
    private byte[] endReadingImg;  // Field to store image data
	
	private String endReading;
	
	private String Maintenance;
	
	@Lob  // Marking this as a large object
  //  @Column(name = "dieselImg", columnDefinition = "MEDIUMBLOB")
    private byte[] dieselImg;  
	
	private String diesel;
	
	private String onwerMobile;
	
	private String driverName;
	
	private String machineNumber;
	
	private String OrderName;
	
	private String petrolPump;
	
	private String fuelRate;
	
	@Column(name = "billed")
	private String billed;
	
	

	public String getIsBilled() {
		return billed;
	}

	public void setIsBilled(String isBilled) {
		this.billed = isBilled;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return reading_date;
	}

	public void setDate(String date) {
		this.reading_date = date;
	}

	public byte[] getStartReadingImg() {
		return startReadingImg;
	}

	public void setStartReadingImg(byte[] startReadingImg) {
		this.startReadingImg = startReadingImg;
	}

	public String getStartReading() {
		return startReading;
	}

	public void setStartReading(String startReading) {
		this.startReading = startReading;
	}

	public byte[] getEndReadingImg() {
		return endReadingImg;
	}

	public void setEndReadingImg(byte[] endReadingImg) {
		this.endReadingImg = endReadingImg;
	}

	public String getEndReading() {
		return endReading;
	}

	public void setEndReading(String endReading) {
		this.endReading = endReading;
	}

	public String getMaintenance() {
		return Maintenance;
	}

	public void setMaintenance(String maintenance) {
		Maintenance = maintenance;
	}

	public byte[] getDieselImg() {
		return dieselImg;
	}

	public void setDieselImg(byte[] dieselImg) {
		this.dieselImg = dieselImg;
	}

	public String getDiesel() {
		return diesel;
	}

	public void setDiesel(String diesel) {
		this.diesel = diesel;
	}

	public String getOnwerMobile() {
		return onwerMobile;
	}

	public void setOnwerMobile(String onwerMobile) {
		this.onwerMobile = onwerMobile;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getMachineNumber() {
		return machineNumber;
	}

	public void setMachineNumber(String machineNumber) {
		this.machineNumber = machineNumber;
	}

	public String getOrderName() {
		return OrderName;
	}
	
	

	public String getPetrolPump() {
		return petrolPump;
	}

	public void setPetrolPump(String petrolPump) {
		this.petrolPump = petrolPump;
	}

	public void setOrderName(String orderName) {
		OrderName = orderName;
	}

	public String getFuelRate() {
		return fuelRate;
	}

	public void setFuelRate(String fuelRate) {
		this.fuelRate = fuelRate;
	}

	

	
	public MachineReading(int id, String date, byte[] startReadingImg, String startReading, byte[] endReadingImg,
			String endReading, String maintenance, byte[] dieselImg, String diesel, String onwerMobile,
			String driverName, String machineNumber, String orderName, String petrolPump, String fuelRate,
			String isBilled) {
		super();
		this.id = id;
		this.reading_date = date;
		this.startReadingImg = startReadingImg;
		this.startReading = startReading;
		this.endReadingImg = endReadingImg;
		this.endReading = endReading;
		Maintenance = maintenance;
		this.dieselImg = dieselImg;
		this.diesel = diesel;
		this.onwerMobile = onwerMobile;
		this.driverName = driverName;
		this.machineNumber = machineNumber;
		OrderName = orderName;
		this.petrolPump = petrolPump;
		this.fuelRate = fuelRate;
		this.billed = isBilled;
	}

	public MachineReading() {
		super();
		// TODO Auto-generated constructor stub
	}

//	@Override
//	public String toString() {
//		return "MachineReading [id=" + id + ", date=" + date + ", startReadingImg=" + Arrays.toString(startReadingImg)
//				+ ", startReading=" + startReading + ", endReadingImg=" + Arrays.toString(endReadingImg)
//				+ ", endReading=" + endReading + ", Maintenance=" + Maintenance + ", dieselImg="
//				+ Arrays.toString(dieselImg) + ", diesel=" + diesel + ", onwerMobile=" + onwerMobile + ", driverName="
//				+ driverName + ", machineNumber=" + machineNumber + ", OrderName=" + OrderName + ", petrolPump="
//				+ petrolPump + "]";
//	}

    

}
