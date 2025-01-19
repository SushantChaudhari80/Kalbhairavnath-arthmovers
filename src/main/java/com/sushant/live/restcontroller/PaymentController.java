package com.sushant.live.restcontroller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.dto.PaymentDTO;
import com.sushant.live.mapper.PaymentHistoryMapper;
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
	
	@GetMapping("/getAll/customer")
	public ResponseEntity<List<String>> getAllCustomerNames(){
		List<String> list = service.getAllCustomerNames(SessionManager.getInstance().getUsername());
		return ResponseEntity.ok(list);
	}
	
	@PostMapping("/add")
	public ResponseEntity<String> addNewPayment(@RequestBody PaymentDTO dto){
		System.out.println("from PaymentController : " + dto.toString());
		Payments amt = new Payments();
		amt.setCustomerName(dto.getCustomer_name());
		    LocalDate today = LocalDate.now();
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	  	    String formattedDate = today.format(formatter);
	  	amt.setPayment_date(formattedDate);
	  	amt.setPayment(dto.getAmount());
	  	amt.setOwnerMobile(SessionManager.getInstance().getUsername());
	  	System.out.println(amt.toString());
	  	String msg = service.addNew(amt);
	  	
	  	return  ResponseEntity.ok(msg);
	}
	
	 @GetMapping("/getAll/byCustomerName")
	    public ResponseEntity<List<List<PaymentHistoryMapper>>> getAllRecords(@RequestParam String cName) {
	        // First table data
	        List<PaymentHistoryMapper> table1 = service.getMachineReadingHistory(cName);

	        // Second table data
	        List<PaymentHistoryMapper> table2 = service.getDumperPaymentHistory(cName);

	        List<List<PaymentHistoryMapper>> response = new ArrayList<>();
	        response.add(table1);
	        response.add(table2);

	        return ResponseEntity.ok(response);
	    }
	 
	 @GetMapping("/getAll/payments/byCustomerName")
	 public ResponseEntity<List<Payments>> getPayments(@RequestParam String cName){
		List<Payments> list =service.getPaidPaymentHistory(cName);
		 return ResponseEntity.ok(list);
	 }
	
}
