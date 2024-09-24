package com.sushant.live.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.model.Coustomer_order;
import com.sushant.live.model.VehicalDTO;
import com.sushant.live.model.Vehicale;
import com.sushant.live.service.OrderService;
import com.sushant.live.util.SessionManager;

@RestController
@RequestMapping("/api/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping("/getAll")
	public ResponseEntity<List<Coustomer_order>> getVehicaleList() {
    	System.out.println("VehicaleController : getVehicaleList()");
    	List<Coustomer_order> list = orderService.getAllOrders();
        return ResponseEntity.ok(list);
    }
	
	  @PostMapping("/add")
	    public ResponseEntity<String> addVehicle(@RequestBody VehicalDTO vehicleDTO) {
	    	System.out.println("VehicaleController : addVehicle()");
	    	Coustomer_order newOrder = new Coustomer_order();
	        newOrder.setCustomer_name(vehicleDTO.getMachineNumber());
	        newOrder.setMachins(vehicleDTO.getCompany());
	        newOrder.setOnwerMobile(SessionManager.getInstance().getUsername());
	       boolean isAdded = orderService.addOrder(newOrder);

	        if (isAdded) {
	            return ResponseEntity.ok("Order added successfully!");
	        } else {
	            System.out.println("Failed to add vehicle. Please try again.");
	            return ResponseEntity.status(500).body("Failed to add vehicle. Please try again.");
	        }
	    }
}
