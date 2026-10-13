package com.sushant.live.dto;


public class DriverLoginResponse {
	
	    private boolean success;
	    private String message;
	    private Object driver;
	    private Object vehicale;
	    private Object order;
	    private Object paymentList;
	    private Object submitedItems;
	    
		public DriverLoginResponse() {
			super();
			// TODO Auto-generated constructor stub
		}
		public DriverLoginResponse(boolean success, String message, Object driver, Object vehicale, Object order,
				Object paymentList, Object submitedItems) {
			super();
			this.success = success;
			this.message = message;
			this.driver = driver;
			this.vehicale = vehicale;
			this.order = order;
			this.paymentList = paymentList;
			this.submitedItems = submitedItems;
		}
		public boolean isSuccess() {
			return success;
		}
		public void setSuccess(boolean success) {
			this.success = success;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public Object getDriver() {
			return driver;
		}
		public void setDriver(Object driver) {
			this.driver = driver;
		}
		public Object getVehicale() {
			return vehicale;
		}
		public void setVehicale(Object vehicale) {
			this.vehicale = vehicale;
		}
		public Object getOrder() {
			return order;
		}
		public void setOrder(Object order) {
			this.order = order;
		}
		public Object getPaymentList() {
			return paymentList;
		}
		public void setPaymentList(Object paymentList) {
			this.paymentList = paymentList;
		}
		public Object getSubmitedItems() {
			return submitedItems;
		}
		public void setSubmitedItems(Object submitedItems) {
			this.submitedItems = submitedItems;
		}
	    
	    
	
}
