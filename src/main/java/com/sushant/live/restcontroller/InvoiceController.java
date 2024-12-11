package com.sushant.live.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
}
