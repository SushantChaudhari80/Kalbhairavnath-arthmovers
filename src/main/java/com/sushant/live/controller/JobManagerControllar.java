package com.sushant.live.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


@Controller
public class JobManagerControllar {

	@GetMapping("/home")
	public String getIndex() {
		System.out.println("Working as expected ");
		return "index";
	}
	@GetMapping("/customer")
	public String addCustomer() {
		return "addCustomer";
	}
	@GetMapping("/reading")
	public String addReading() {
		return "captureReading";
	}
	@GetMapping("/login")
	public String login() {
		return "loginnew";
	}
}
