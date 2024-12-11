package com.sushant.live.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.repository.PaymentRepository;
import com.sushant.live.util.SessionManager;

@Service
public class InvoiceService {
	
	
	@Autowired
	PaymentRepository paymentRepo;
	
	public String getAmount(String cName) {
		return paymentRepo.getTotalAmt(SessionManager.getInstance().getUsername(), cName);
	}
}
