package com.sushant.live.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.Payments;
import com.sushant.live.repository.PaymentRepository;

@Service
public class PaymentService {
	
	@Autowired(required = true)
	PaymentRepository repo;
	
	public List<Payments> getAll(String onwerMobile){
		return repo.getByOnwer(onwerMobile);
	}
	public List<String> getAllCustomerNames(String onwerMobile){
		List<Payments> list = repo.getByOnwer(onwerMobile);
		List<String> customerNames = new ArrayList();
		for(Payments p : list) {
			if (!customerNames.contains(p.getCustomerName())) {
				customerNames.add(p.getCustomerName());
			}
			}
			
		return customerNames;
	}
	
	public String addNew(Payments payment){
		try {
			repo.save(payment);
			return "Payment Added Successfully";
		}catch(Exception e) {
			return e.getLocalizedMessage();
		}
	}

}
