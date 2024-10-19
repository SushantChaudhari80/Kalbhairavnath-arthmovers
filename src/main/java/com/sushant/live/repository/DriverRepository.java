package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sushant.live.model.VehicaleDriver;

@Repository
public interface DriverRepository extends JpaRepository<VehicaleDriver , Integer> {
	 
	@Query("SELECT v FROM VehicaleDriver v WHERE v.onwerMobile = :mobile")
	    public List<VehicaleDriver> findAllByOwnerMobile(@Param("mobile") String mobile);
	
	@Query("SELECT v FROM VehicaleDriver v WHERE machineNumber = :mid")
    public List<VehicaleDriver> getByMNumber(@Param("mid") String mid);

	    @Transactional
	    @Modifying
	    @Query("UPDATE VehicaleDriver vd SET vd.machineNumber = :mid WHERE vd.id = :driverId")
	    void assignDriver(@Param("mid") String mid, @Param("driverId") int driverId);
	    
	    @Transactional
	    @Modifying
	    @Query("UPDATE VehicaleDriver vd SET vd.machineNumber = '' WHERE vd.driverName = :DriverName")
	    void removeDriver(@Param("DriverName") String DriverName);
}
