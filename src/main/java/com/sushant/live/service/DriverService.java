package com.sushant.live.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.util.SessionManager;

@Service
public class DriverService {

	@Autowired
	private DriverRepository driverRepo;
	
	 public boolean addDriver(VehicaleDriver driver) {
	        try {
	            driverRepo.save(driver);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    public List<VehicaleDriver> getAllDrivers() {
	    	return driverRepo.findAllByOwnerMobile(SessionManager.getInstance().getUsername());
	    }
}
