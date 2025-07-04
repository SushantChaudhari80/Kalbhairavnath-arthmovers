package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Coustomer_order;

import jakarta.transaction.Transactional;
@Repository
public interface OrderRepository extends JpaRepository<Coustomer_order , Integer>{

	@Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile")
    public List<Coustomer_order> findAllByOwnerMobile(@Param("mobile") String mobile);
    
    @Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile AND v.machins LIKE %:mNumber%")
    public Coustomer_order findAllByMachine(@Param("mobile") String mobile, @Param("mNumber") String mNumber);

    @Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile and status='Active'")
    public List<Coustomer_order> getActiceOrders(@Param("mobile") String mobile);
    
    @Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile and status='Pending'")
    public List<Coustomer_order> getPendingOrders(@Param("mobile") String mobile);
   
    @Query("SELECT v FROM Coustomer_order v WHERE v.onwerMobile = :mobile and status='Complete'")
    public List<Coustomer_order> getCompleteOrders(@Param("mobile") String mobile);

    @Modifying
    @Query("update Coustomer_order set machins = '' where machins like %:machins% and id!=:Id")
    @Transactional
    void removeMachin(@Param("machins") String machins ,@Param("Id") int id);

   
}
