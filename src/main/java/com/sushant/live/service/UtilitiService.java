package com.sushant.live.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.dto.DashboardUtilities;
import com.sushant.live.model.MachineReading;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.repository.DumperTreepRepository;
import com.sushant.live.repository.OrderRepository;
import com.sushant.live.repository.ReadingRepository;
import com.sushant.live.repository.VehicaleRepository;
import com.sushant.live.util.SessionManager;

@Service
public class UtilitiService {
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private VehicaleRepository vehicalRepo;
	
	@Autowired 
	DumperTreepRepository dumperRepo;
	
	@Autowired
	DriverRepository driverRepo;
	
	@Autowired 
	ReadingRepository readingRepo;

	 public DashboardUtilities collectUtilities() {
		 DashboardUtilities temp = new DashboardUtilities();
		 temp.setTotalOrders(orderRepo.findAllByOwnerMobile(SessionManager.getInstance().getUsername()).size());
		 temp.setTotalVehicales(vehicalRepo.findAllByOwnerMobile(SessionManager.getInstance().getUsername()).size());
		 temp.setActiveOrders(orderRepo.getActiceOrders(SessionManager.getInstance().getUsername()).size());
		 temp.setPendingOrders(orderRepo.getPendingOrders(SessionManager.getInstance().getUsername()).size());
		 temp.setCompleteOrders(orderRepo.getCompleteOrders(SessionManager.getInstance().getUsername()).size());
		 temp.setBilledTreeps(dumperRepo.getBilledTreeps(SessionManager.getInstance().getUsername()).size());
		 temp.setUnbilledTreeps(dumperRepo.findAllByOwnerMobile(SessionManager.getInstance().getUsername()).size());
		 temp.setTotalDivers(driverRepo.findAllByOwnerMobile(SessionManager.getInstance().getUsername()).size());
		 
		 List<MachineReading> list = readingRepo.getDiesel(SessionManager.getInstance().getUsername());
		 int sum = 0;
		 for (MachineReading reading : list) {
		     if (reading.getDiesel() != null) {
		         try {
		             sum += Integer.parseInt(reading.getDiesel());
		         } catch (NumberFormatException e) {
		             System.err.println("Invalid diesel value: " + reading.getDiesel());
		         }
		     }
		 }

		 temp.setDiesel(sum);
		 return temp;
	    }
	
}
