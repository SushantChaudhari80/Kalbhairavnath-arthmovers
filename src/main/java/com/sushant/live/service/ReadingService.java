package com.sushant.live.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.sushant.live.dto.ReadingDTO;
import com.sushant.live.model.Coustomer_order;
import com.sushant.live.model.MachineReading;
import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.repository.OrderRepository;
import com.sushant.live.repository.ReadingRepository;
import com.sushant.live.util.SessionManager;

@Service
public class ReadingService {
	
	@Autowired
	ReadingRepository repo;
	
	@Autowired
	DriverRepository drRepo;
	
	@Autowired
	OrderRepository orderRepo;
	
	public String saveReading(ReadingDTO dto) {
	    try {
	        // Get today's date and format it
	        LocalDate today = LocalDate.now();
	        String formattedDate = today.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

	        // Check for existing record
	        MachineReading existingReading = repo.checkRecords(formattedDate, dto.getMachineNumber(), dto.getSelectedOwnerMobile());

	        if (existingReading == null) {
	            // Create new record
	            MachineReading newReading = new MachineReading();
	            newReading.setDate(formattedDate);
	            newReading.setStartReadingImg(dto.getStartReading());
	            newReading.setEndReadingImg(dto.getEndReading());
	            newReading.setMaintenance(dto.getMaintenance());
	            newReading.setDieselImg(dto.getDisel());
	            newReading.setOnwerMobile(dto.getSelectedOwnerMobile());
	            newReading.setDriverName(dto.getDriverId());
	            newReading.setMachineNumber(dto.getMachineNumber());

	            // Fetch order details
	            Coustomer_order order = orderRepo.findAllByMachine(dto.getSelectedOwnerMobile(), dto.getMachineNumber());
	            if (order != null) {
	                newReading.setOrderName(order.getCustomer_name());
	            } else {
	                return "Order details not found for the given machine.";
	            }

	            // Save the new reading
	            repo.save(newReading);
	            return "Reading Added Successfully.";

	        } else {
	            // Update existing record
	            boolean isUpdated = false;

	            // Update only if the DTO provides new data, otherwise keep the existing value
	            if (dto.getStartReading() != null) {
	                existingReading.setStartReadingImg(dto.getStartReading());
	                isUpdated = true;
	            }
	            if (dto.getEndReading() != null) {
	                existingReading.setEndReadingImg(dto.getEndReading());
	                isUpdated = true;
	            }
	            if (dto.getDisel() != null) {
	                existingReading.setDieselImg(dto.getDisel());
	                isUpdated = true;
	            }

	            // If no updates are made, return appropriate message
	            if (!isUpdated) {
	                return "Reading Already Submitted.";
	            }

	            // Update maintenance
	            existingReading.setMaintenance(sumField(existingReading.getMaintenance(), dto.getMaintenance()));

	            // Save updated reading
	            repo.save(existingReading);
	            return "Reading Updated Successfully.";
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "An error occurred: " + e.getMessage();
	    }
	}

	// Utility method to safely sum maintenance values
	private String sumField(String existingValue, String newValue) {
	    try {
	        int existing = existingValue != null ? Integer.parseInt(existingValue) : 0;
	        int newVal = newValue != null ? Integer.parseInt(newValue) : 0;
	        return String.valueOf(existing + newVal);
	    } catch (NumberFormatException e) {
	        throw new IllegalArgumentException("Invalid numeric data.");
	    }
	}

	
	public List<MachineReading> getAllByMachine(String machineNumber){
		return repo.getAllByM(SessionManager.getInstance().getUsername(), machineNumber);
		
	}
	
	public List<MachineReading> getAll(){
		return repo.getAll(SessionManager.getInstance().getUsername());
		
	}
	
	
}

