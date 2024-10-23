package com.sushant.live.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.DriverPayment;
import com.sushant.live.repository.DriverPaymentRepository;
import com.sushant.live.util.SessionManager;

@Service
public class DriverPaymentService {
	
	@Autowired
	private DriverPaymentRepository repo;
	
	public String savePayment(String drName , String amount) {
		try {
			 LocalDate today = LocalDate.now();
			    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			    String formattedDate = today.format(formatter);
			DriverPayment drp=new DriverPayment();
			drp.setDate(formattedDate);
			drp.setAmount(amount);
			drp.setDriverName(drName);
			drp.setOnwerMobile(SessionManager.getInstance().getUsername());
			repo.save(drp);
			return "Payment Added Successfully.";
		}catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
			return "Error Occured while adding payment.";
		}
		
	}
	
	public List<DriverPayment> getAll(String drName){
		return repo.getAll(drName,SessionManager.getInstance().getUsername());
	}

}
