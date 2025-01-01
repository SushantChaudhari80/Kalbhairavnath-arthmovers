package com.sushant.live.dto;

public class InvoiceDTO {
	
	String billedDate;
	
	String invoice;


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

	public InvoiceDTO( String billedDate, String invoice) {
		super();
		this.billedDate = billedDate;
		this.invoice = invoice;
	}

	public InvoiceDTO() {
		super();
	}
	
	

}
