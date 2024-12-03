package com.sushant.live.restcontroller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.dto.PaymentDTO;
import com.sushant.live.model.Payments;
import com.sushant.live.service.PaymentService;
import com.sushant.live.util.SessionManager;

@RestController
@RequestMapping("/api/payment")
public class PaymentController {

	@Autowired(required = true)
	PaymentService service;
	
	@GetMapping("/getAll")
	public ResponseEntity<List<Payments>> getAll(){
		List<Payments> list = service.getAll(SessionManager.getInstance().getUsername());
		return ResponseEntity.ok(list);
	}
	
	@PostMapping("/add")
	public ResponseEntity<String> addNewPayment(@RequestBody PaymentDTO dto){
		System.out.println("from PaymentController : ");
		Payments amt = new Payments();
		amt.setCustomerName(dto.getCustomer_name());
		    LocalDate today = LocalDate.now();
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	  	    String formattedDate = today.format(formatter);
	  	amt.setPayment_date(formattedDate);
	  	amt.setPayment(dto.getAmount());
	  	amt.setOwnerMobile(SessionManager.getInstance().getUsername());
	  	String msg = service.addNew(amt);
	  	return  ResponseEntity.ok(msg);
	}
	
}
