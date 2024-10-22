package com.sushant.live.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.sushant.live.dto.ReadingDTO;
import com.sushant.live.model.MachineReading;
import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.repository.ReadingRepository;
import com.sushant.live.util.SessionManager;

@Service
public class ReadingService {
	
	@Autowired
	ReadingRepository repo;
	
	@Autowired
	DriverRepository drRepo;
	
	public String saveReading(ReadingDTO dto) {
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
	        reading.setStartReading(dto.getStartReading());
	        reading.setEndReading(dto.getEndReading());
	        reading.setMaintenance(dto.getMaintenance());
	        reading.setDisel(dto.getDisel());
	        reading.setOnwerMobile(dto.getSelectedOwnerMobile());
	        reading.setDriverName(dto.getDriverId());
	        reading.setMachineNumber(dto.getMachineNumber());

	        System.out.println("New Record: " + reading.toString());
	        repo.save(reading); // Save the new record

	        return "Reading Added Successfully.";

	    } else {
	        // Update the existing record if it's found
	        boolean updated = false;

	        // Update the start reading if it's null and if DTO provides a new start reading
	        if (existingReading.getStartReading() == null && dto.getStartReading() != null) {
	            existingReading.setStartReading(dto.getStartReading());
	            updated = true;
	        }

	        // Update the end reading if it's null and if DTO provides a new end reading
	        if (existingReading.getEndReading() == null && dto.getEndReading() != null) {
	            existingReading.setEndReading(dto.getEndReading());
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
	            int d1 = Integer.parseInt(existingReading.getDisel() != null ? existingReading.getDisel() : "0");
	            int d2 = Integer.parseInt(dto.getDisel() != null ? dto.getDisel() : "0");
	            existingReading.setDisel(String.valueOf(d1 + d2));
	        } catch (NumberFormatException e) {
	            return "Invalid Disel Data.";
	        }

	        System.out.println("Updating Record: " + existingReading.toString());
	        repo.save(existingReading); // Save the updated record

	        return "Reading Updated Successfully.";
	    }
	}

	
	public List<MachineReading> getAllByMachine(String machineNumber){
		return repo.getAllByM(SessionManager.getInstance().getUsername(), machineNumber);
		
	}
	
	
}


//
//reading.setDate(formattedDate);
//if (dto.getStartReading() != null) {
//    reading.setReadingtype("Start Reading");
//    reading.setReadingCount(dto.getStartReading());
//} 
//else if (dto.getEndReading() != null) {
//    reading.setReadingtype("End Reading");
//    reading.setReadingCount(dto.getEndReading());
//} else {
//    return "No reading provided"; // If neither start nor end reading is provided
//}
//reading.setMaintenance(dto.getMaintenance());
//reading.setOnwerMobile(dto.getSelectedOwnerMobile());
//reading.setDriverName(dto.getDriverId());
//reading.setMachineNumber(dto.getMachineNumber());
//
//// Check if a reading for the date and type already exists
//boolean flag = check(formattedDate, reading.getReadingtype() , reading.getMachineNumber() );
//System.out.println("returned flag " + flag);
//
//// Return appropriate response based on the check
//if (flag) {
//    return "Reading Submitted Already";
//} else {
//    repo.save(reading);  // Save the reading to the database
//    reading.toString();
//    return "Reading Added Successfully.";
//}
