package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.VehicaleDriver;

@Repository
public interface DriverRepository extends JpaRepository<VehicaleDriver , Integer> {
	 
	@Query("SELECT v FROM VehicaleDriver v WHERE v.onwerMobile = :mobile")
	    public List<VehicaleDriver> findAllByOwnerMobile(@Param("mobile") String mobile);

}
