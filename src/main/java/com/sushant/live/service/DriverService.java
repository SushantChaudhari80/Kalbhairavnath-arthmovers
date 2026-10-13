package com.sushant.live.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.sushant.live.dto.DriverLoginResponse;
import com.sushant.live.mapper.VehicaleDriverProjection;
import com.sushant.live.model.Coustomer_order;
import com.sushant.live.model.DriverPayment;
import com.sushant.live.model.MachineReading;
import com.sushant.live.model.Vehicale;
import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.repository.DriverPaymentRepository;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.repository.DumperTreepRepository;
import com.sushant.live.repository.OrderRepository;
import com.sushant.live.repository.ReadingRepository;
import com.sushant.live.repository.VehicaleRepository;
import com.sushant.live.util.SessionManager;

@Service
public class DriverService {

	@Autowired
	private DriverRepository driverRepo;
	
	@Autowired
	private DriverPaymentRepository driverPaymentRepo;
	
	@Autowired
	private VehicaleRepository vehicleRepo;
	
	@Autowired 
	private OrderRepository orderRepository;
	
	@Autowired
	private ReadingRepository readingRepository;
	
	@Autowired
	private DumperTreepRepository dumperTreepRepository;
	
	public Object  login(String mobile , String password) {
		
		Map<String , Object >  response= new HashMap<>();
		
		System.out.println(mobile);
		VehicaleDriver driver = driverRepo.findByDriverMobile(mobile);

	    if (driver == null) {
	    	response.put("success", false);
	    	response.put("message","Driver not found with provided mobile number.");
	        return response;
	    }

	    if (driver.getPassword() == null) {
	    	response.put("success", false);
	    	response.put("message","Please generate a password first.");
	        return response;
	    }

	    if (!driver.getPassword().equals(password)) {
	    	response.put("success", false);
	    	response.put("message","Invalid password. Please try again.");
	        return response;
	    }
	    
	    Vehicale vehicle = vehicleRepo.findByMachineNumber(driver.getMachineNumber());
	    Coustomer_order order = orderRepository.findAllByMachine(driver.getOnwerMobile(), driver.getMachineNumber());
	    List<DriverPayment> driverPaymentList = driverPaymentRepo.getAll(driver.getDriverName(), driver.getOwnerMobile());
	    Object data = new Object();
	    if(vehicle.getV_type().equals("Excavator")) {
	    	data =  readingRepository.getAllByDriver(driver.getOwnerMobile() , driver.getDriverName());
	    }else {
	    	data = dumperTreepRepository.getBySubmitted(driver.getDriverName(), driver.getOwnerMobile());
	    }
	    
	    return new DriverLoginResponse(true,
	            "Login successful",
	            driver,
	            vehicle,
	            order ,
	            driverPaymentList, 
	            data);
	}
	
	 public boolean addDriver(VehicaleDriver driver) {
	        try {
	        	LocalDate today = LocalDate.now();
		  	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		  	    String formattedDate = today.format(formatter);
		  	    driver.setCreateDate(formattedDate);
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
	    
	    public Object changePassword(String driverMobile , String password) {
	    	try {

	            VehicaleDriver driver = driverRepo.findByDriverMobile(driverMobile);

	            if (driver == null) {
	                return ResponseEntity.badRequest()
	                        .body(Map.of(
	                                "success", false,
	                                "message", "Driver not found."
	                        ));
	            }

	            driver.setPassword(password);
	            driverRepo.save(driver);

	            return ResponseEntity.ok(
	                    Map.of(
	                            "success", true,
	                            "message", "Password updated successfully."
	                    )
	            );

	        } catch (Exception e) {

	            return ResponseEntity.internalServerError()
	                    .body(Map.of(
	                            "success", false,
	                            "message", e.getMessage()
	                    ));
	        }
	    }
	    
}
