package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.DumperTreep;

@Repository
public interface DumperTreepRepository extends JpaRepository<DumperTreep, Integer> {
    
	@Query("SELECT v FROM DumperTreep v WHERE v.omobile = :mobile AND (v.isBilled IS NULL OR v.isBilled = '')")
    List<DumperTreep> findAllByOwnerMobile(@Param("mobile") String mobile);
	
	@Modifying
	@Query("UPDATE DumperTreep SET isBilled = 'true' WHERE omobile = :mobile AND id = :id")
	void updateTreepById(@Param("id") int id, @Param("mobile") String mobile);
	
	@Query("SELECT v FROM DumperTreep v WHERE v.omobile = :mobile AND v.isBilled = 'true'")
    List<DumperTreep> getBilledTreeps(@Param("mobile") String mobile);

}

