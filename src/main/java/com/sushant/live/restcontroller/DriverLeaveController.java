package com.sushant.live.restcontroller;

import com.sushant.live.model.DriverLeave;
import com.sushant.live.service.DriverLeaveService;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/driver-leaves")
@Validated
public class DriverLeaveController {

	@Autowired
    private DriverLeaveService driverLeaveService;

    // Create a leave request
    @PostMapping
    public DriverLeave createLeave(
            @Valid @RequestBody DriverLeave request) {
        return driverLeaveService.createLeave(request);
    }

    // Get all leave requests
    @GetMapping
    public List<DriverLeave> getAllLeaves() {
        return driverLeaveService.getAllLeaves();
    }

    // Get a leave request by ID
    @GetMapping("/{id}")
    public DriverLeave getLeaveById(@PathVariable Long id) {
        return driverLeaveService.getLeaveById(id);
    }

    // Filter leave requests by driver name
    @GetMapping("/driver/{driverName}")
    public List<DriverLeave> getLeavesByDriver(
            @PathVariable @NotBlank String driverName) {
        return driverLeaveService.getLeavesByDriver(driverName);
    }

    // Filter leave requests by status
    @GetMapping("/status/{status}")
    public List<DriverLeave> getLeavesByStatus(
            @PathVariable String status) {
        return driverLeaveService.getLeavesByStatus(status);
    }

    // Approve or reject a leave request
    @PatchMapping("/{id}/status")
    public DriverLeave updateLeaveStatus(
            @PathVariable Long id,
            @RequestParam String status,
            @RequestParam(required = false) String adminRemarks) {
        return driverLeaveService.updateLeaveStatus(
                id, status, adminRemarks);
    }

    // Delete a leave request
    @DeleteMapping("/{id}")
    public void deleteLeave(@PathVariable Long id) {
        driverLeaveService.deleteLeave(id);
    }
}

