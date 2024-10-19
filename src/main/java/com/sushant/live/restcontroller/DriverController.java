package com.sushant.live.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.dto.DriverDTO;
import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.service.DriverService;
import com.sushant.live.util.SessionManager;

@RestController
@RequestMapping("/api/driver")
public class DriverController {
	
	@Autowired
	private DriverService driverService;
	
	@GetMapping("/getAll")
	public ResponseEntity<List<VehicaleDriver>> getVehicaleList() {
    	System.out.println("VehicaleController : getVehicaleList()");
    	List<VehicaleDriver> list = driverService.getAllDrivers();
        return ResponseEntity.ok(list);
    }
	
	  @PostMapping("/add")
	    public ResponseEntity<String> addVehicle(@RequestBody DriverDTO driverDTO) {
	    	System.out.println("DriverController : addDriver()");
	    	VehicaleDriver driver = new VehicaleDriver();
	        driver.setDriverName(driverDTO.getDriverName());
	        driver.setDriverMobile(driverDTO.getDriverMobile());
	        driver.setDriverAddress(driverDTO.getDriverAddress());
	        driver.setDriverAadhar(driverDTO.getDriverAadhar());
	        driver.setOnwerMobile(SessionManager.getInstance().getUsername());
	       boolean isAdded = driverService.addDriver(driver);

	        if (isAdded) {
	            return ResponseEntity.ok("Driver added successfully!");
	        } else {
	            System.out.println("Failed to add Driver. Please try again.");
	            return ResponseEntity.status(500).body("Failed to add vehicle. Please try again.");
	        }
	    }
	  
	  
	  @GetMapping("/getByMachineNumber")
		public ResponseEntity<List<VehicaleDriver>> getByNumber(@RequestParam String i) {
	    	List<VehicaleDriver> list = driverService.getByNumber(i);
	        return ResponseEntity.ok(list);
	    }
	  
	  @GetMapping("/assignDriver")
		public ResponseEntity<String> assignDriver(@RequestParam String mNumber , @RequestParam  int DriverId) {
	    	String msg = driverService.assignDeriver(mNumber, DriverId);
	        return ResponseEntity.ok(msg);
	    }
		
	  
	  @GetMapping("/remove")
		public ResponseEntity<String> removeDriver(@RequestParam  String DriverName) {
	    	String msg = driverService.removeDriver(DriverName);
	        return ResponseEntity.ok(msg);
	    }

}
