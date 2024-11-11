package com.sushant.live.restcontroller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.dto.OrderDTO;
import com.sushant.live.model.Coustomer_order;
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
	
	@GetMapping("/getById")
	public ResponseEntity<Coustomer_order> getOrderById(@RequestParam int id) {
    	System.out.println("VehicaleController : getVehicaleList()");
    	Coustomer_order list = orderService.getById(id);
    	System.out.println("Customer N :"+list.getCustomer_name());
    	return ResponseEntity.ok(list);
        
    }
	
	  @PostMapping("/add")
	    public ResponseEntity<String> addVehicle(@RequestBody OrderDTO orderDTO) {
	    	System.out.println("VehicaleController : addVehicle()");
	    	Coustomer_order newOrder = new Coustomer_order();
	        newOrder.setCustomer_name(orderDTO.getCustomer_name());
	        newOrder.setMachins(orderDTO.getMachine_numbers());
	        newOrder.setAddress(orderDTO.getAddress());
	        newOrder.setOnwerMobile(SessionManager.getInstance().getUsername());
	        LocalDate today = LocalDate.now();
	  	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	  	    String formattedDate = today.format(formatter);
	  	    
	  	    newOrder.setOrder_date(formattedDate);
	       // System.out.println("Machine Number"+orderDTO.getCompany());
	       boolean isAdded = orderService.addOrder(newOrder);

	        if (isAdded) {
	            return ResponseEntity.ok("Order added successfully!");
	        } else {
	            System.out.println("Failed to add vehicle. Please try again.");
	            return ResponseEntity.status(500).body("Failed to add vehicle. Please try again.");
	        }
	    }
	  
	  @PostMapping("/update")
	  public ResponseEntity<Coustomer_order> updateOrder(@RequestBody Coustomer_order updatedOrder) {
	      Coustomer_order existingOrder = orderService.getById(updatedOrder.getId());
	      if (existingOrder != null) {
	          // Update the order details
	          existingOrder.setCustomer_name(updatedOrder.getCustomer_name());
	          existingOrder.setStatus(updatedOrder.getStatus());
	          existingOrder.setDeliveryDate(updatedOrder.getDeliveryDate());
	          existingOrder.setAddress(updatedOrder.getAddress());
	          existingOrder.setMachins(updatedOrder.getMachins());
	          existingOrder.setOnwerMobile(SessionManager.getInstance().getUsername());
	      
	          // Save the updated order
	          orderService.updateOrder(existingOrder);
	          return ResponseEntity.ok(existingOrder);
	      } else {
	          return ResponseEntity.notFound().build();
	      }
	  }

}
