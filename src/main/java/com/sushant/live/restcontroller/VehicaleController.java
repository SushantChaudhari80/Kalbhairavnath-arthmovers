package com.sushant.live.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sushant.live.dto.VehicalDTO;
import com.sushant.live.model.Customer;
import com.sushant.live.model.Vehicale;
import com.sushant.live.service.VehicaleService;
import com.sushant.live.util.SessionManager;


@RestController
@RequestMapping("/api/vehicles")
public class VehicaleController {

    @Autowired
    private VehicaleService vehicaleService;

    @PostMapping("/add")
    public ResponseEntity<String> addVehicle(@RequestBody VehicalDTO vehicleDTO) {
    	System.out.println("VehicaleController : addVehicle()");
        Vehicale newVehicale = new Vehicale();
        newVehicale.setMachineNumber(vehicleDTO.getMachineNumber());
        newVehicale.setCompany(vehicleDTO.getCompany());
        newVehicale.setOnwer_mobile(SessionManager.getInstance().getUsername());
        boolean isAdded = vehicaleService.addVehicale(newVehicale);

        if (isAdded) {
            return ResponseEntity.ok("Vehicle added successfully!");
        } else {
            System.out.println("Failed to add vehicle. Please try again.");
            return ResponseEntity.status(500).body("Failed to add vehicle. Please try again.");
        }
    }

    
    
    @GetMapping("/getAll")
    public ResponseEntity<List<Vehicale>> getVehicaleList() {
    	System.out.println("VehicaleController : getVehicaleList()");
    	List<Vehicale> list = vehicaleService.getAllVehical();
        return ResponseEntity.ok(list);
    }
}
