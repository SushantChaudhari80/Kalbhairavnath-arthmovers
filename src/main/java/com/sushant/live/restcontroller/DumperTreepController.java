package com.sushant.live.restcontroller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.dto.DumperTreepDTO;
import com.sushant.live.model.DumperTreep;
import com.sushant.live.service.DumperTreepService;
import com.sushant.live.util.SessionManager;

@RestController
@RequestMapping("/api/treep")
public class DumperTreepController {
	
	@Autowired
	DumperTreepService service;
	
	@PostMapping("/add")
	public ResponseEntity<String> addTreep(@RequestBody DumperTreepDTO dto){
		System.out.println(dto.toString());
		DumperTreep treep = new DumperTreep();
		treep.setCustomerName(dto.getCustomerName());
		treep.setAdvance(dto.getAdvance());
		treep.setDiesel(dto.getDiesel());
		treep.setSelectedVehicle(dto.getSelectedVehicle());
		treep.setSoilBrass(dto.getSoilBrass());
		treep.setSoilRate(dto.getSoilRate());
		treep.setTotalPayment(dto.getTotalPayment());
		treep.setItem(dto.getItem());
		treep.setCreateDate(LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
		treep.setOmobile(SessionManager.getInstance().getUsername());
		System.out.println(treep.toString());
	  return ResponseEntity.ok(service.addTreep(treep));
	}
	
	@GetMapping("/getAll")
	public ResponseEntity<List<DumperTreep>> getAll(){
		return ResponseEntity.ok(service.getAll());
	}
	
	@PostMapping("/updateTreep/{id}")
	public ResponseEntity<String> updateTreep(@PathVariable int id) {
	    try {
	        String response = service.updateTreep(id);
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
