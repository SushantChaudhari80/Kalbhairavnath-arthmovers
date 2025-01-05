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
	 
	 public boolean updateOrder(Coustomer_order order) {
	        try {
	        	orderRepository.save(order);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    
}
