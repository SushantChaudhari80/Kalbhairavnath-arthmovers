package com.sushant.live.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/login")
public class LoginCotroller {
	
	 @GetMapping("/user")
	 public Map<String, String> getCredentials(@RequestParam String email, @RequestParam String pass) {
	        System.out.println("Email: " + email + ", Password: " + pass);
	        
	        // Create a response map to return as JSON
	        Map<String, String> response = new HashMap<>();
	        if(email.equals("chaudharisushant80@gmail.com") & pass.equals("123")) {
	        response.put("message", "success");
			 }else {
				 response.put("message", "Invalid Credentials , rertry");
			 }
			        
	        
	        return response;  // Spring Boot will automatically convert this map to JSON
	    }
}
	
