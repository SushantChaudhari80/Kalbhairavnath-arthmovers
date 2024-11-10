package com.sushant.live.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.Coustomer_order;
import com.sushant.live.model.Vehicale;
import com.sushant.live.repository.OrderRepository;
import com.sushant.live.util.SessionManager;

@Service
public class OrderService {

	
	@Autowired
	OrderRepository orderRepository;
	
	public List<Coustomer_order> getAllOrders() {
		return orderRepository.findAllByOwnerMobile(SessionManager.getInstance().getUsername());
	}

	
	public Coustomer_order getById(int id) {
		return orderRepository.getOne(Integer.valueOf(id));
	}

	
	 public boolean addOrder(Coustomer_order order) {
		 Coustomer_order order1 = orderRepository.findAllBy(SessionManager.getInstance().getUsername(), order.getMachins());
		 if(order1 == null) {
			 try {
		        	orderRepository.save(order);
		            return true;
		        } catch (Exception e) {
		            e.printStackTrace();
		            return false;
		        }
		 }else {
			 System.out.println("Machine is assign to anther order , please remove first, then retry.");
		 return false;
		 }
	       
	    }
	 
	 public boolean updateOrder(Coustomer_order order) {
		 if(order.getMachins() == null) {
			 orderRepository.save(order);
			 return true;
		 }else {
		 Coustomer_order order1 = orderRepository.findAllBy(SessionManager.getInstance().getUsername(), order.getMachins());
		 if(order1 == null) {
			 try {
		        	orderRepository.save(order);
		            return true;
		        } catch (Exception e) {
		            e.printStackTrace();
		            return false;
		        }
	
	        }else {
	        	return false;
	        }
		 }
	 }
	    
}
