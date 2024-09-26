package com.sushant.live.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.Vehicale;
import com.sushant.live.repository.VehicaleRepository;
import com.sushant.live.util.SessionManager;

@Service
public class VehicaleService {
	
    @Autowired
    private VehicaleRepository vehicaleRepository;

    public boolean addVehicale(Vehicale vehicale) {
        try {
            vehicaleRepository.save(vehicale);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Vehicale> getAllVehical() {
    	return vehicaleRepository.findAllByOwnerMobile(SessionManager.getInstance().getUsername());
    }

}
