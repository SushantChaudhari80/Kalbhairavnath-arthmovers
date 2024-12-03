package com.sushant.live.service;

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
	
	public String addNew(Payments payment){
		try {
			repo.save(payment);
			return "Payment Added Successfully";
		}catch(Exception e) {
			return e.getLocalizedMessage();
		}
	}

}
