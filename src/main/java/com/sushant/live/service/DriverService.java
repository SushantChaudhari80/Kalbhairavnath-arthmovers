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
	    
	    public List<VehicaleDriver> getByNumber(String i) {
	    	return driverRepo.getByMNumber(i);
	    }
	    
	    public String assignDeriver(String MachineNumber , int DriverName ) {
	    	try {
	    		driverRepo.assignDriver(MachineNumber, DriverName);
	    		return "Driver Assign successfully to : "+MachineNumber;
	    	}catch(Exception e) {
	    		System.out.println("Exception occured : " + e.getLocalizedMessage());
	    		return "Error occured while assign driver , please contact Administrator";
	    	}
	    }
	    
	    public String removeDriver(String DriverName) {
	    	try {
	    		driverRepo.removeDriver(DriverName);
	    		return "Driver Removed successfully";
	    	}catch(Exception e) {
	    		System.out.println("Exception occured : " + e.getLocalizedMessage());
	    		return "Error occured while assign driver , please contact Administrator";
	    	}
	    }
}
