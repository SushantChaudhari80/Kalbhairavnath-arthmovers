package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sushant.live.model.Payments;

public interface PaymentRepository extends JpaRepository<Payments , Integer> {
	
	@Query(value = "select * from payment where owner_mobile= :ownerMobile" , nativeQuery = true)
	public List<Payments> getByOnwer(@Param("ownerMobile") String ownerMobile);
	
	 @Query(value = "SELECT SUM(payment) FROM payment WHERE owner_mobile = :ownerMobile AND customer_name = :cName", nativeQuery = true)
	public String getTotalAmt(@Param("ownerMobile") String ownerMobile ,@Param("cName") String cName );

}
