package com.sushant.live.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.Coustomer_order;
import com.sushant.live.model.Vehicale;
import com.sushant.live.repository.OrderRepository;
import com.sushant.live.util.SessionManager;

import jakarta.transaction.Transactional;

@Service
public class OrderService {

	
	@Autowired
	OrderRepository orderRepository;
	
	public List<Coustomer_order> getAllOrders() {
		return orderRepository.findAllByOwnerMobile(SessionManager.getInstance().getUsername());
	}
	public List<Coustomer_order> getActiveOrders() {
		return orderRepository.getActiceOrders(SessionManager.getInstance().getUsername());
	}

	public List<Coustomer_order> getPendingOrders() {
		return orderRepository.getPendingOrders(SessionManager.getInstance().getUsername());
	}
	
	public List<Coustomer_order> getCompleteOrders() {
		return orderRepository.getCompleteOrders(SessionManager.getInstance().getUsername());
	}
	
	
	public Coustomer_order getById(int id) {
		return orderRepository.getOne(Integer.valueOf(id));
	}

	
	 public boolean addOrder(Coustomer_order order) {
	        try {
	        	orderRepository.save(order);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 
	 @Transactional
	 public boolean updateOrder(Coustomer_order order) {
	     try {
//	         String ownerMobile = SessionManager.getInstance().getUsername();
//
//	         if (order == null) {
//	             return false;
//	         }
//
//	         // Fetch the existing order being updated.
//	         Coustomer_order existingOrder = orderRepository.findById(order.getId())
//	                 .orElse(null);
//
//	         if (existingOrder == null) {
//	             return false;
//	         }
//
//	         String machineNumbers = order.getMachins();
//
//	         if (machineNumbers != null && !machineNumbers.trim().isEmpty()) {
//
//	             String[] machines = Arrays.stream(machineNumbers.split(","))
//	                     .map(String::trim)
//	                     .filter(machine -> !machine.isEmpty())
//	                     .distinct()
//	                     .toArray(String[]::new);
//
//	             for (String machine : machines) {
//
//	                 // Find the other order containing this machine.
//	                 Coustomer_order previousOrder =
//	                         orderRepository.findAllByMachine(ownerMobile, machine);
//
//	                 if (previousOrder == null
//	                         || previousOrder.getId()==order.getId()) {
//	                     continue;
//	                 }
//
//	                 String updatedMachineNumbers =
//	                         Arrays.stream(
//	                                 previousOrder.getMachins() == null
//	                                         ? new String[0]
//	                                         : previousOrder.getMachins().split(","))
//	                         .map(String::trim)
//	                         .filter(value -> !value.isEmpty())
//	                         .filter(value -> !value.equalsIgnoreCase(machine))
//	                         .collect(Collectors.joining(","));
//
//	                 previousOrder.setMachins(updatedMachineNumbers);
//	                 orderRepository.save(previousOrder);
//	             }
//	         }
//
//	         // Update the current order's fields.
//	         existingOrder.setCustomer_name(order.getCustomer_name());
//	         existingOrder.setStatus(order.getStatus());
//	         existingOrder.setDeliveryDate(order.getDeliveryDate());
//	         existingOrder.setAddress(order.getAddress());
//	         existingOrder.setMachins(machineNumbers);
//	         existingOrder.setOnwerMobile(ownerMobile);

	         orderRepository.save(order);

	         return true;

	     } catch (Exception e) {
	         e.printStackTrace();
	         throw new RuntimeException("Failed to update customer order", e);
	     }
	 }
	    
	    
}
