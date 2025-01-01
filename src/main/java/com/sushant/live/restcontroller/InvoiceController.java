package com.sushant.live.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import com.sushant.live.dto.InvoiceDTO;
import com.sushant.live.model.InvoiceTemplate;
import com.sushant.live.service.InvoiceService;

@RestController
@RequestMapping("/api/invoice")
public class InvoiceController {
	
	@Autowired
	InvoiceService service;

    @GetMapping("/getTotalPaid")
    public String getTotalPaid(@RequestParam String cName) {
    	return service.getAmount(cName);
    }
    
    @GetMapping("/getAllInvoice")
    public ResponseEntity<List<InvoiceTemplate>> getAll() {
    	return ResponseEntity.ok(service.getAll());
    }
    
    @PutMapping("/save")
    public ResponseEntity<String> saveInvoice(@RequestBody InvoiceDTO dto) {
        try {
        	System.out.println("length : "+dto.getInvoice().length());
            String result = service.saveInvoice(dto);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("Error saving invoice: " + e.getMessage());
        }
    }
    
    @GetMapping("/getById/{id}")
	public ResponseEntity<String> updateTreep(@PathVariable String id) {
	    try {
	        String response = service.getInvoiceById(id);
	        return ResponseEntity.ok(response);
	    } catch (IllegalArgumentException e) {
	        return ResponseEntity.badRequest().body(e.getMessage());
	    } catch (Exception e) {
	       e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("An unexpected error occurred. Please try again later.");
	    }
	}

}
