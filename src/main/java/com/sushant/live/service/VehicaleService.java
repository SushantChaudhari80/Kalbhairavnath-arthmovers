package com.sushant.live.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.Vehicale;
import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.repository.VehicaleRepository;
import com.sushant.live.response.VehicleResponse;
import com.sushant.live.util.SessionManager;

@Service
public class VehicaleService {
	
    @Autowired
    private VehicaleRepository vehicaleRepository;
    
    @Autowired
    private DriverRepository driverRepository;

    public boolean addVehicale(Vehicale vehicale) {
        try {
            vehicaleRepository.save(vehicale);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<VehicleResponse> getAllVehical() {
    	
    	List<Vehicale> vehicles = vehicaleRepository.findAllByOwnerMobile(SessionManager.getInstance().getUsername());
    	List<VehicleResponse> vehicleRes = new ArrayList<>();
    	for(Vehicale v : vehicles) {
    	    VehicleResponse res = new VehicleResponse();
    	    res.setVehicle_id(v.getId());
    	    res.setMachine_number(v.getMachineNumber());
    	    res.setCompany(v.getCompany());
    	    res.setV_type(v.getV_type());
    	    List<VehicaleDriver> driverList = driverRepository.getByMNumber(v.getMachineNumber());
    	    String driverNames="";
    	    for(VehicaleDriver driver : driverList) {
    	    	driverNames = driverNames + " "+driver.getDriverName();
    	    }
    	    res.setDriver_names(driverNames);
    	    vehicleRes.add(res);
    	}
    	return vehicleRes;
    }
    
    public List<Vehicale> getAllLoadingVehical() {
    	return vehicaleRepository.findAllLoadingByOwnerMobile(SessionManager.getInstance().getUsername());
    }

}
