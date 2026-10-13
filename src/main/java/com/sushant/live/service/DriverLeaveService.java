package com.sushant.live.service;

import com.sushant.live.model.DriverLeave;
import com.sushant.live.model.DriverLeave.LeaveStatus;
import com.sushant.live.repository.DriverLeaveRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.util.List;

@Service
public class DriverLeaveService {

	@Autowired
    private DriverLeaveRepository driverLeaveRepository;

    @Transactional
    public DriverLeave createLeave(DriverLeave request) {

        validateLeave(request);

        request.setId(null);
        request.setStatus(LeaveStatus.OPEN);

        return driverLeaveRepository.save(request);
    }

    @Transactional(readOnly = true)
    public List<DriverLeave> getAllLeaves() {
        return driverLeaveRepository.findAllByOrderByCreatedAtDesc();
    }

    @Transactional(readOnly = true)
    public DriverLeave getLeaveById(Long id) {
        return driverLeaveRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Leave request not found: " + id));
    }

    @Transactional(readOnly = true)
    public List<DriverLeave> getLeavesByDriver(String driverName) {

        if (driverName == null || driverName.isBlank()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Driver name is required");
        }

        return driverLeaveRepository
                .findByDriverNameIgnoreCaseOrderByCreatedAtDesc(
                        driverName.trim());
    }

    @Transactional(readOnly = true)
    public List<DriverLeave> getLeavesByStatus(String statusValue) {

        LeaveStatus status = parseStatus(statusValue);

        return driverLeaveRepository
                .findByStatusOrderByCreatedAtDesc(status);
    }

    @Transactional
    public DriverLeave updateLeaveStatus(
            Long id,
            String statusValue,
            String adminRemarks) {

        DriverLeave leave = getLeaveById(id);
        LeaveStatus newStatus = parseStatus(statusValue);

        if (leave.getStatus() == LeaveStatus.CANCELLED) {
            throw new ResponseStatusException(
                    HttpStatus.CONFLICT,
                    "Cancelled leave requests cannot be updated");
        }

        if (newStatus == LeaveStatus.OPEN) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Status cannot be changed back to OPEN");
        }

        leave.setStatus(newStatus);
        leave.setAdminRemarks(
                adminRemarks == null ? null : adminRemarks.trim());

        return driverLeaveRepository.save(leave);
    }

    @Transactional
    public void deleteLeave(Long id) {

        DriverLeave leave = getLeaveById(id);

        if (leave.getStatus() == LeaveStatus.APPROVED) {
            throw new ResponseStatusException(
                    HttpStatus.CONFLICT,
                    "Approved leave requests cannot be deleted");
        }

        driverLeaveRepository.delete(leave);
    }

    private void validateLeave(DriverLeave request) {

        if (request.getDriverName() == null
                || request.getDriverName().isBlank()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Driver name is required");
        }

        if (request.getLeaveType() == null
                || request.getLeaveType().isBlank()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Leave type is required");
        }

        if (request.getFromDate() == null
                || request.getToDate() == null) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "From date and to date are required");
        }

        if (request.getToDate().isBefore(request.getFromDate())) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "To date cannot be before from date");
        }

        if (request.getFromDate().isBefore(LocalDate.now())) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Leave start date cannot be in the past");
        }
    }

    private LeaveStatus parseStatus(String value) {

        if (value == null || value.isBlank()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Leave status is required");
        }

        try {
            return LeaveStatus.valueOf(
                    value.trim().toUpperCase());
        } catch (IllegalArgumentException ex) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Invalid status. Allowed: OPEN, APPROVED, REJECTED, CANCELLED");
        }
    }
}

