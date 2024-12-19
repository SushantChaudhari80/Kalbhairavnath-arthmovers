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
	
	public String saveReading(ReadingDTO dto)  {
		try {
	    // Get today's date and format it
	    LocalDate today = LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	    String formattedDate = today.format(formatter);

	    // Check if a record exists for the same date and machine number
	    MachineReading existingReading = repo.checkRecords(formattedDate, dto.getMachineNumber(),dto.getSelectedOwnerMobile());

	    if (existingReading == null) {
	        // Create new record if no existing record is found
	        MachineReading reading = new MachineReading();
	        reading.setDate(formattedDate);
	        reading.setStartReading("");
	        
	        if(dto.getStartReading()!=null)
	        reading.setStartReadingImg(dto.getStartReading());
	        
	        reading.setEndReading("");
	        
	         if(dto.getEndReading() != null)
	         reading.setEndReadingImg(dto.getEndReading());
	         
	        reading.setMaintenance(dto.getMaintenance());
	        reading.setDiesel("");
	        
	        if(dto.getDisel()!= null)
	        reading.setDieselImg(dto.getDisel());
	        
	        reading.setOnwerMobile(dto.getSelectedOwnerMobile());
	        reading.setDriverName(dto.getDriverId());
	        reading.setMachineNumber(dto.getMachineNumber());
	        System.out.println(dto.getSelectedOwnerMobile()+dto.getMachineNumber());
	        Coustomer_order order= orderRepo.findAllByMachine(dto.getSelectedOwnerMobile(),dto.getMachineNumber());
	        reading.setOrderName(order.getCustomer_name());

	        System.out.println("New Record: " + reading.toString());
	        repo.save(reading); // Save the new record

	        return "Reading Added Successfully.";

	    } else {
	        // Update the existing record if it's found
	        boolean updated = false;

	        // Update the start reading if it's null and if DTO provides a new start reading
	        if (existingReading.getStartReadingImg() == null && dto.getStartReading() != null) {
	           // existingReading.setStartReading(dto.getStartReading());
	        	existingReading.setStartReading("");
	            updated = true;
	        }

	        // Update the end reading if it's null and if DTO provides a new end reading
	        if (existingReading.getEndReadingImg()==null && dto.getEndReading() != null) {
	           // existingReading.setEndReading(dto.getEndReading());
	        	existingReading.setEndReading("");
	            updated = true;
	        }

	        // If neither start nor end readings can be updated, the reading is already complete
	        if (!updated) {
	            return "Reading Already Submitted.";
	        }

	        // Update maintenance by adding to the existing maintenance
	        try {
	            int currentMaintenance = Integer.parseInt(existingReading.getMaintenance() != null ? existingReading.getMaintenance() : "0");
	            int newMaintenance = Integer.parseInt(dto.getMaintenance() != null ? dto.getMaintenance() : "0");
	            existingReading.setMaintenance(String.valueOf(currentMaintenance + newMaintenance));
	        } catch (NumberFormatException e) {
	            return "Invalid Maintenance Data.";
	        }
	        try {
//	            int d1 = Integer.parseInt(existingReading.getDisel() != null ? existingReading.getDisel() : "0");
//	            int d2 = Integer.parseInt(dto.getDisel() != null ? dto.getDisel() : "0");
//	            existingReading.setDiesel(String.valueOf(d1 + d2));
	        	existingReading.setDiesel("");
	        } catch (NumberFormatException e) {
	        	e.printStackTrace();
	            return "Invalid Disel Data.";
	        }

	        System.out.println("Updating Record: " + existingReading.toString());
	        repo.save(existingReading); // Save the updated record

	        return "Reading Updated Successfully.";
	    }
		}catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			e.printStackTrace();
			return e.getLocalizedMessage();
		}
	}

	
	public List<MachineReading> getAllByMachine(String machineNumber){
		return repo.getAllByM(SessionManager.getInstance().getUsername(), machineNumber);
		
	}
	
	public List<MachineReading> getAll(){
		return repo.getAll(SessionManager.getInstance().getUsername());
		
	}
	
	
}

