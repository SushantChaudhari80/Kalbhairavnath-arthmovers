package com.sushant.live.dto;

import com.sushant.live.model.Coustomer_order;

public class DriverLoginResponse {
	
	    private boolean success;
	    private String message;
	    private Object data;
	    private Object vehicale;
	    private Object order;
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
		public Object getData() {
			return data;
		}
		public void setData(Object data) {
			this.data = data;
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
		
		public DriverLoginResponse(boolean success, String message, Object data, Object vehicale, Object order) {
			super();
			this.success = success;
			this.message = message;
			this.data = data;
			this.vehicale = vehicale;
			this.order = order;
		}
		public DriverLoginResponse() {
			super();
			// TODO Auto-generated constructor stub
		}
}
