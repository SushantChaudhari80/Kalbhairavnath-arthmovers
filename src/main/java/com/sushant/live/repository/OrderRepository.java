package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Coustomer_order;
@Repository
public interface OrderRepository extends JpaRepository<Coustomer_order , Integer>{

	@Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile")
    public List<Coustomer_order> findAllByOwnerMobile(@Param("mobile") String mobile);
    
    @Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile AND v.machins LIKE %:mNumber%")
    public Coustomer_order findAllByMachine(@Param("mobile") String mobile, @Param("mNumber") String mNumber);
    
    @Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile AND v.machins LIKE %:mNumber%")
    public Coustomer_order findAllBy(@Param("mobile") String mobile, @Param("mNumber") String mNumber);

	
}
