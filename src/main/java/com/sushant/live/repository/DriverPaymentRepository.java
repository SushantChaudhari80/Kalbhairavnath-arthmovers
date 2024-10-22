package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.DriverPayment;
import com.sushant.live.model.VehicaleDriver;

@Repository
public interface DriverPaymentRepository extends JpaRepository<DriverPayment , Integer> {
	
	 
	 @Query(value = "SELECT * FROM driver_payment WHERE driver_name = :drName AND onwer_mobile = :ownerM", nativeQuery = true)
	    List<DriverPayment> getAll(@Param("drName") String drName, @Param("ownerM") String ownerM);

}
