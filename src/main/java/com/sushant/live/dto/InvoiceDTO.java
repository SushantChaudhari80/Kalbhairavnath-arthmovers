package com.sushant.live.dto;

public class InvoiceDTO {
	
	String billedDate;
	
	String invoice;
	
	String customerName;


	public String getBilledDate() {
		return billedDate;
	}

	public void setBilledDate(String billedDate) {
		this.billedDate = billedDate;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public InvoiceDTO() {
		super();
	}

	public InvoiceDTO(String billedDate, String invoice, String customerName) {
		super();
		this.billedDate = billedDate;
		this.invoice = invoice;
		this.customerName = customerName;
	}

	

}
