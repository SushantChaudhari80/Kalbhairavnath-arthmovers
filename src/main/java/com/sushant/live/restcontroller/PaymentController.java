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
	    public ResponseEntity<List<List<Map<String, Object>>>> getAllRecords(@RequestParam String cName) {
//	        // First table data
//	        List<Map<String, Object>> table1 = service.getMachineReadingHistory(cName);
//
//	        // Second table data
//	        List<Map<String, Object>> table2 = service.getSoilPaymentHistory(cName);
		  List<Map<String, Object>> table1Data = List.of(
			        Map.of(
			            "id", 1,
			            "date", "2025-01-01",
			            "customer_name", "John Doe",
			            "machine_number", "M1234",
			            "start_reading", 100,
			            "end_reading", 200,
			            "total_payment", 500.50
			        ),
			        Map.of(
			            "id", 2,
			            "date", "2025-01-02",
			            "customer_name", "Alice Smith",
			            "machine_number", "M5678",
			            "start_reading", 300,
			            "end_reading", 400,
			            "total_payment", 600.75
			        )
			    );

			    // Simulate data for Table 2
			    List<Map<String, Object>> table2Data = List.of(
			        Map.of(
			            "id", 1,
			            "date", "2025-01-03",
			            "customer_name", "Jane Doe",
			            "selected_vehicle", "Truck 123",
			            "soil_brass", 50,
			            "soil_rate", 10,
			            "total_payment", 700.75
			        ),
			        Map.of(
			            "id", 2,
			            "date", "2025-01-04",
			            "customer_name", "Bob Brown",
			            "selected_vehicle", "Excavator 456",
			            "soil_brass", 60,
			            "soil_rate", 15,
			            "total_payment", 900.00
			        )
			    );

	        // Combine both tables into a single list
	        List<List<Map<String, Object>>> response = new ArrayList<>();
	        response.add(table1Data);
	        response.add(table2Data);

	        return ResponseEntity.ok(response);
	    }
	
}
