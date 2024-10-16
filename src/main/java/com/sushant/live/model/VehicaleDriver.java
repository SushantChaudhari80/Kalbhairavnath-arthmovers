package com.sushant.live.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class VehicaleDriver {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
	    private int id;

	    @Column(name = "driverName", length = 255, nullable = false)
	    private String driverName;

	    @Column(name = "driverMobile", length = 255, nullable = false)
	    private String driverMobile;
	    
	    @Column(name = "driverAddress", length = 255, nullable = false)
	    private String driverAddress;
	    
	    @Column(name = "driverAadhar", length = 255, nullable = false)
	    private String driverAadhar;
	    
	    @Column(name = "onwerMobile", nullable = false)
	    private String onwerMobile;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getDriverName() {
			return driverName;
		}

		public void setDriverName(String driverName) {
			this.driverName = driverName;
		}

		public String getDriverMobile() {
			return driverMobile;
		}

		public void setDriverMobile(String driverMobile) {
			this.driverMobile = driverMobile;
		}

		public String getDriverAddress() {
			return driverAddress;
		}

		public void setDriverAddress(String driverAddress) {
			this.driverAddress = driverAddress;
		}

		public String getDriverAadhar() {
			return driverAadhar;
		}

		public void setDriverAadhar(String driverAadhar) {
			this.driverAadhar = driverAadhar;
		}

		public String getOnwerMobile() {
			return onwerMobile;
		}

		public void setOnwerMobile(String onwerMobile) {
			this.onwerMobile = onwerMobile;
		}

		public VehicaleDriver() {
			super();
			// TODO Auto-generated constructor stub
		}

		public VehicaleDriver(int id, String driverName, String driverMobile, String driverAddress, String driverAadhar,
				String onwerMobile) {
			super();
			this.id = id;
			this.driverName = driverName;
			this.driverMobile = driverMobile;
			this.driverAddress = driverAddress;
			this.driverAadhar = driverAadhar;
			this.onwerMobile = onwerMobile;
		}

	    
		
}
