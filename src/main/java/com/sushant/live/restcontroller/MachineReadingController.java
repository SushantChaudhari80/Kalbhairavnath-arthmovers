package com.sushant.live.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import com.sushant.live.dto.ReadingDTO;
import com.sushant.live.model.MachineReading;
import com.sushant.live.service.ReadingService;

@RestController
public class MachineReadingController {

    @Autowired
    private ReadingService machineReadingService;

    @PostMapping("/driver/reading/submit")
    public String handleFormSubmit( @RequestBody ReadingDTO dto) {
        try {
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
//    @GetMapping("/vehicle/getAllRecord")
//    public  ResponseEntity<List<MachineReading>> getAllRecord(@RequestParam String machinN){
//    	
//    	return ResponseEntity.ok(list);
//    }
}
