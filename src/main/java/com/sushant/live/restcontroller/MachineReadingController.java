package com.sushant.live.restcontroller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.sushant.live.dto.DieselDTO;
import com.sushant.live.dto.ReadingDTO;
import com.sushant.live.model.MachineReading;
import com.sushant.live.repository.ReadingRepository;
import com.sushant.live.service.ReadingService;

@RestController
public class MachineReadingController {

    @Autowired
    private ReadingService machineReadingService;
    
    @Autowired
	ReadingRepository repo;

    @PostMapping(value = "/driver/reading/submit",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String handleFormSubmit(
    		  @RequestParam(value = "startReading", required = false) MultipartFile startReading,
    	        @RequestParam(value = "endReading", required = false) MultipartFile endReading,
    	        @RequestParam(value = "disel", required = false) MultipartFile disel,
    	        @RequestParam("maintenanceNumber") String maintenance,
    	        @RequestParam("driverId") String driverId,
    	        @RequestParam("machineNumber") String machineNumber,
    	        @RequestParam("selectedOwnerMobile") String selectedOwnerMobile) {
            try {
                ReadingDTO dto = new ReadingDTO();
                if(startReading != null )
                dto.setStartReading(startReading.getBytes());
                
                if(endReading != null)
                dto.setEndReading(endReading.getBytes());
                
                if(disel != null)
                dto.setDisel(disel.getBytes());
                
                dto.setMaintenance(maintenance);
                dto.setDriverId(driverId);
                dto.setMachineNumber(machineNumber);
                dto.setSelectedOwnerMobile(selectedOwnerMobile);

                return machineReadingService.saveReading(dto);
            } catch (Exception e) {
                return "Error processing the form: " + e.getMessage();
            }
        }
    
    @GetMapping("/vehicle/getRecords")
    public  ResponseEntity<List<MachineReading>> getAllbyMachine(@RequestParam String machinN){
    	System.out.println("MachineReadingController : getAllbyMachine()");
    	List<MachineReading> list =  machineReadingService.getAllByMachine(machinN);
    	return ResponseEntity.ok(list);
    }
    
    @GetMapping("/vehicle/getAll")
    public  ResponseEntity<List<MachineReading>> getAll(){
    	System.out.println("MachineReadingController : getAllbyOnwer()");
    	List<MachineReading> list =  machineReadingService.getAll();
    	return ResponseEntity.ok(list);
    }
    
    @GetMapping("/vehicle/getAll/billed")
    public  ResponseEntity<List<MachineReading>> getAllBilled(){
    	System.out.println("MachineReadingController : getAllbyOnwer()");
    	List<MachineReading> list =  machineReadingService.getAllBilled();
    	return ResponseEntity.ok(list);
    }
//    @GetMapping("/vehicle/getAllRecord")
//    public  ResponseEntity<List<MachineReading>> getAllRecord(@RequestParam String machinN){
//    	
//    	return ResponseEntity.ok(list);
//    }
    
 // Fetch the record by ID to display the details (including images)
    @GetMapping("/admin/reading/getById")
    public ResponseEntity<ReadingDTO> getReading( @RequestParam("id") int id) {
        // Retrieve the reading data based on the ID
    	MachineReading reading = repo.findById(id).orElseThrow(() -> new RuntimeException("Reading not found"));
        
        ReadingDTO dto = new ReadingDTO();

        dto.setStartReading(reading.getStartReadingImg());
        dto.setEndReading(reading.getEndReadingImg());
        dto.setDisel(reading.getDieselImg());
       System.out.println(dto.toString());
        return ResponseEntity.ok(dto);
    }

    @PutMapping("/admin/reading")
    public ResponseEntity<String> updateReading(@RequestParam("id") int id, 
                                                @RequestParam("startReading") String startReading, 
                                                @RequestParam("endReading") String endReading, 
                                                @RequestParam("diesel") String diesel,
                                                @RequestParam(value = "startReadingImg", required = false) MultipartFile startReadingImg,
                                                @RequestParam(value = "endReadingImg", required = false) MultipartFile endReadingImg,
                                                @RequestParam(value = "dieselImg", required = false) MultipartFile dieselImg) {
        // Retrieve the existing reading record
    	MachineReading reading = repo.findById(id).orElseThrow(() -> new RuntimeException("Reading not found"));
    	System.out.println(reading.getStartReading() +":"+reading.getEndReading()+":"+reading.getDiesel() );
       System.out.println(startReading +":"+endReading+":"+diesel);
        // Update reading counts
    	if( startReading != null && startReading != "" && startReading.length()>0) {
    		System.out.println("Setting Start reading");
    		reading.setStartReading(startReading);
    	}
        if(endReading != null && endReading != "" && endReading.length()>0) {
        	System.out.println("Setting end reading");
        	reading.setEndReading(endReading);
        	}
        if(diesel != null && diesel!="" && diesel.length()>0) {
        	System.out.println("Setting disel"); 
        	reading.setDiesel(diesel);
        	}
        

//        // Handle image updates if present
//        try {
//            if (startReadingImg != null && !startReadingImg.isEmpty()) {
//                reading.setStartReadingImg(startReadingImg.getBytes());  // Update image in database
//            }
//            if (endReadingImg != null && !endReadingImg.isEmpty()) {
//                reading.setEndReadingImg(endReadingImg.getBytes());  // Update image in database
//            }
//            if (dieselImg != null && !dieselImg.isEmpty()) {
//                reading.setDieselImg(dieselImg.getBytes());  // Update image in database
//            }
//        } catch (IOException e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating images: " + e.getMessage());
//        }

      
        repo.save(reading);

        return ResponseEntity.ok("Reading updated successfully");
    }
    
    @PostMapping("/api/diesel/addDiesel")
    public ResponseEntity<String> addDiesel(@RequestBody DieselDTO dto){
    	//System.out.println(dto.toString());
    	return ResponseEntity.ok(machineReadingService.addDiesel(dto));
    }
    
    @GetMapping("/vehicle/getDisel")
    public  ResponseEntity<List<MachineReading>> getDisel(){
    	System.out.println("MachineReadingController : getAllbyOnwer()");
    	List<MachineReading> list =  machineReadingService.getDisel();
    	return ResponseEntity.ok(list);
    }
    
    @PostMapping("/api/reading/updateReading/{id}")
	public ResponseEntity<String> updateReading(@PathVariable int id) {
	    try {
	        String response = machineReadingService.updateReading(id);
	        return ResponseEntity.ok(response);
	    } catch (IllegalArgumentException e) {
	        return ResponseEntity.badRequest().body(e.getMessage());
	    } catch (Exception e) {
	       e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("An unexpected error occurred. Please try again later.");
	    }
	}

    
}
