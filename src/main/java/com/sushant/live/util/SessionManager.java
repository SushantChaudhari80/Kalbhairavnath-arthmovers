package com.sushant.live.util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class SessionManager {

	    private static final SessionManager INSTANCE = new SessionManager();

	   
	    private String username;

	   
	    private SessionManager() {}

	    
	    public static SessionManager getInstance() {
	        return INSTANCE;
	    }

	    // Method to set the username
	    public void setUsername(String username) {
	    	
	        this.username = username;
	    }

	    // Method to get the username
	    public String getUsername() {
	    	if(username == null) {
	    	try {
		    	 HttpClient client = HttpClient.newHttpClient();
		         HttpRequest request = HttpRequest.newBuilder()
		                 .uri(new URI("http://localhost:8084/login"))
		                 .GET()
		                 .build();
		         HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
		    	}catch(Exception e) {
                    e.printStackTrace();
		    	}
	    	return "";
	    	}else {
	        return username;
	        }
	    }
}
