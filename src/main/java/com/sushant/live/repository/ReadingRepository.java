package com.sushant.live.repository;

import org.springframework.stereotype.Repository;

import com.sushant.live.model.MachineReading;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface ReadingRepository extends JpaRepository<MachineReading , Integer> {
	
	//select * from machinereading where date='21/10/2024'
	
	 @Query(value = "SELECT * FROM machinereading WHERE date = :date and machine_number= :machineNumber and onwer_mobile = :onwerMobile", nativeQuery = true)
	 MachineReading checkRecords(@Param("date") String date, @Param("machineNumber") String machineNumber , @Param("onwerMobile") String onwerMobile);

	 @Query(value = "SELECT * FROM machinereading WHERE onwer_mobile = :onwerMobile and machine_number= :machineNumber and order_name IS NOT NULL", nativeQuery = true)
	    List<MachineReading> getAllByM(@Param("onwerMobile") String onwerMobile, @Param("machineNumber") String machineNumber);
	 
//	 @Query(value = """
//		          SELECT
//				    m.id,
//				    m.maintenance,
//				    m.order_name,
//				    m.date,
//				    m.diesel,
//				    m.diesel_img,
//				    m.driver_name,
//				    m.end_reading,
//				    m.end_reading_img,
//				    m.machine_number,
//				    m.onwer_mobile,
//				    m.start_reading,
//				    m.start_reading_img,
//				    m.fuel_rate,
//				    m.petrol_pump
//				FROM machinereading m,vehicale v WHERE 
//				m.onwer_mobile =v.onwer_mobile and 
//				m.machine_number =v.machine_number and order_name IS NOT NULL and 
//				m.onwer_mobile = '8983333399' and v_type != 'Dumper' and (m.is_billed IS NULL OR m.is_billed = '');
//		        """, nativeQuery = true)
//		List<MachineReading> getAll(@Param("onwerMobile") String onwerMobile);
	 
	 @Query(value = """
			    SELECT
			        m.id,
			        m.maintenance,
			        m.order_name,
			        m.reading_date,
			        m.diesel,
			        m.diesel_img,
			        m.driver_name,
			        m.end_reading,
			        m.end_reading_img,
			        m.machine_number,
			        m.onwer_mobile,
			        m.start_reading,
			        m.start_reading_img,
			        m.fuel_rate,
			        m.petrol_pump,
			        m.billed
			    FROM machinereading m
			    JOIN vehicale v ON m.onwer_mobile = v.onwer_mobile AND m.machine_number = v.machine_number
			    WHERE order_name IS NOT NULL
			      AND (m.billed IS NULL OR m.billed ='')
			      AND m.onwer_mobile = :onwerMobile
			      AND v.v_type != 'Dumper'
			     """, nativeQuery = true)
			List<MachineReading> getAll(@Param("onwerMobile") String onwerMobile);

	 @Query(value = """
			    SELECT
			        m.id,
			        m.maintenance,
			        m.order_name,
			        m.reading_date,
			        m.diesel,
			        m.diesel_img,
			        m.driver_name,
			        m.end_reading,
			        m.end_reading_img,
			        m.machine_number,
			        m.onwer_mobile,
			        m.start_reading,
			        m.start_reading_img,
			        m.fuel_rate,
			        m.petrol_pump,
			        m.billed
			    FROM machinereading m
			    JOIN vehicale v ON m.onwer_mobile = v.onwer_mobile AND m.machine_number = v.machine_number
			    WHERE order_name IS NOT NULL
			      AND m.billed='true'
			      AND m.onwer_mobile = :onwerMobile
			      AND v.v_type != 'Dumper'
			     """, nativeQuery = true)
			List<MachineReading> getAllBilled(@Param("onwerMobile") String onwerMobile);

	 
	 @Query(value = "SELECT * FROM machinereading WHERE onwer_mobile = :onwerMobile and diesel is not null", nativeQuery = true)
		List<MachineReading> getDiesel(@Param("onwerMobile") String onwerMobile);
	 
	    @Modifying
		@Query(value = "UPDATE machinereading SET billed = 'true' WHERE onwer_mobile = :mobile AND id = :id", nativeQuery = true)
		void updateReadingById(@Param("id") int id, @Param("mobile") String mobile);
	    
	    @Query(value = """
			    SELECT
			        m.id,
			        m.maintenance,
			        m.order_name,
			        m.reading_date,
			        m.diesel,
			        m.diesel_img,
			        m.driver_name,
			        m.end_reading,
			        m.end_reading_img,
			        m.machine_number,
			        m.onwer_mobile,
			        m.start_reading,
			        m.start_reading_img,
			        m.fuel_rate,
			        m.petrol_pump,
			        m.billed
			    FROM machinereading m
			      WHERE order_name IS NOT NULL
			      AND m.onwer_mobile = :onwerMobile
			      AND m.order_name= :orderName
			     """, nativeQuery = true)
			List<MachineReading> getByCustomerName(@Param("onwerMobile") String onwerMobile,@Param("orderName") String orderName);
}
