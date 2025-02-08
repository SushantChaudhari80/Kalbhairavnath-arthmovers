package com.sushant.live.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "invoice")
public class InvoiceTemplate {
	
	@Id
	String ID;
	
	String billedDate;
	
	@Column(name = "invoice", columnDefinition = "CLOB")
	private String invoice;
	
	String omobile;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

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

	

	public String getOmobile() {
		return omobile;
	}

	public void setOmobile(String omobile) {
		this.omobile = omobile;
	}
	

	public InvoiceTemplate(String iD, String billedDate, String invoice, String omobile) {
		super();
		ID = iD;
		this.billedDate = billedDate;
		this.invoice = invoice;
		this.omobile = omobile;
	}

	public InvoiceTemplate() {
		super();
	}

}
