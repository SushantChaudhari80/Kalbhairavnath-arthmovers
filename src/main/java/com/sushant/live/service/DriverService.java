package com.sushant.live.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.mapper.VehicaleDriverProjection;
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
	    
	    public List<VehicaleDriver> getAllDrivers(String ownerMobile) {
	    	List<VehicaleDriver> list = new ArrayList();
	    	List<VehicaleDriverProjection> rr= driverRepo.findAllMachineDrivers(ownerMobile);
	    	for(VehicaleDriverProjection p : rr) {
	    		VehicaleDriver dr= new VehicaleDriver();
	    		dr.setId(p.getId().intValue());
	    		dr.setDriverName(p.getDriverName());
	    		dr.setDriverMobile(p.getDriverMobile());
	    		dr.setDriverAddress(p.getDriverAddress());
	    		dr.setDriverAadhar(p.getDriverAadhar());
	    		dr.setDriverLiencense(p.getDriverLiencense());
	    		dr.setMachineNumber(p.getMachineNumber());
	    		dr.setOnwerMobile(p.getOnwerMobile());
	    		dr.setOwnerMobile(p.getOnwerMobile());
	    		list.add(dr);
	    	}
	    	return list;
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
	    
	    public VehicaleDriver getById(int id) {
	    	return driverRepo.getById(id);
	    }
	    
	    
}
