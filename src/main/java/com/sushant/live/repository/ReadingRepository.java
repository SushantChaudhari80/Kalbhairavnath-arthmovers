package com.sushant.live.repository;

import org.springframework.stereotype.Repository;

import com.sushant.live.model.MachineReading;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface ReadingRepository extends JpaRepository<MachineReading , Integer> {
	
	//select * from machinereading where date='21/10/2024'
	
	 @Query(value = "SELECT * FROM machinereading WHERE date = :date and machine_number= :machineNumber and onwer_mobile = :onwerMobile", nativeQuery = true)
	 MachineReading checkRecords(@Param("date") String date, @Param("machineNumber") String machineNumber , @Param("onwerMobile") String onwerMobile);

	 @Query(value = "SELECT * FROM machinereading WHERE onwer_mobile = :onwerMobile and machine_number= :machineNumber", nativeQuery = true)
	    List<MachineReading> getAllByM(@Param("onwerMobile") String onwerMobile, @Param("machineNumber") String machineNumber);
	 
	 @Query(value = "SELECT * FROM machinereading WHERE onwer_mobile = :onwerMobile", nativeQuery = true)
	List<MachineReading> getAll(@Param("onwerMobile") String onwerMobile);
}
