package com.sushant.live.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Coustomer_order {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-incrementing ID
    private int id;
	
	 @Column(name = "customer_name", length = 50, nullable = false)
	 private String customer_name;

	    @Column(name = "status", length = 20)
	    private String status;

	    @Column(name = "deliveryDate")
	    private String deliveryDate;
	    
	    @Column(name = "machins", nullable = false)
	    private String machins;
	    
	    @Column(name = "address", nullable = false)
	    private String address;
	    
	    @Column(name = "onwerMobile", nullable = false)
	    private String onwerMobile;
	    

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public int getId() {
			return id;
		}

		public String getOnwerMobile() {
			return onwerMobile;
		}

		public void setOnwerMobile(String onwerMobile) {
			this.onwerMobile = onwerMobile;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getCustomer_name() {
			return customer_name;
		}

		public void setCustomer_name(String customer_name) {
			this.customer_name = customer_name;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getDeliveryDate() {
			return deliveryDate;
		}

		public void setDeliveryDate(String deliveryDate) {
			this.deliveryDate = deliveryDate;
		}

		public String getMachins() {
			return machins;
		}

		public void setMachins(String machins) {
			this.machins = machins;
		}

		public Coustomer_order(int id, String customer_name, String status, String deliveryDate, String machins , String onwerMobile , String address) {
			super();
			this.id = id;
			this.customer_name = customer_name;
			this.status = status;
			this.deliveryDate = deliveryDate;
			this.machins = machins;
			this.onwerMobile = onwerMobile;
			this.address =  address;
		}

		public Coustomer_order() {
			super();
		}
	    
	    
	    
	    
}
