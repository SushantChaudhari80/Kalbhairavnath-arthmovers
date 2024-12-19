package com.sushant.live.restcontroller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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
		treep.setCreateDate(LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
		treep.setOmobile(SessionManager.getInstance().getUsername());
	  return ResponseEntity.ok(service.addTreep(treep));
	}
	
	@GetMapping("/getAll")
	public ResponseEntity<List<DumperTreep>> getAll(){
		return ResponseEntity.ok(service.getAll());
	}

}
