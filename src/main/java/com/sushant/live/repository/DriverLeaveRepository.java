package com.sushant.live.repository;

import com.sushant.live.model.DriverLeave;
import com.sushant.live.model.DriverLeave.LeaveStatus;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface DriverLeaveRepository
        extends JpaRepository<DriverLeave, Long> {

    List<DriverLeave> findAllByOrderByCreatedAtDesc();

    List<DriverLeave> findByDriverNameIgnoreCaseOrderByCreatedAtDesc(
            String driverName);

    List<DriverLeave> findByStatusOrderByCreatedAtDesc(
            LeaveStatus status);

    List<DriverLeave> findByDriverNameIgnoreCaseAndStatusOrderByCreatedAtDesc(
            String driverName,
            LeaveStatus status);
    
    List<DriverLeave> findByDriverNameIgnoreCaseAndStatusAndFromDateLessThanEqualAndToDateGreaterThanEqual(
            String driverName,
            LeaveStatus status,
            LocalDate monthEnd,
            LocalDate monthStart
    );
}
