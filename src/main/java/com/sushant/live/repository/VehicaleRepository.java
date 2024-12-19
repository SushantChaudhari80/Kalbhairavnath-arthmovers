package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Vehicale;

@Repository
public interface VehicaleRepository extends JpaRepository<Vehicale, Integer> {
	
	    @Query("SELECT v FROM Vehicale v WHERE v.onwerMobile = :mobile")
	    public List<Vehicale> findAllByOwnerMobile(@Param("mobile") String mobile);
	    

	    @Query("SELECT v FROM Vehicale v WHERE v.onwerMobile = :mobile and v_type='Dumper'")
	    public List<Vehicale> findAllLoadingByOwnerMobile(@Param("mobile") String mobile);

}
