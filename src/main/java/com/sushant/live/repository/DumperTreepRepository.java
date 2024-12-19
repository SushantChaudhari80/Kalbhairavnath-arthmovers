package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.DumperTreep;

@Repository
public interface DumperTreepRepository extends JpaRepository<DumperTreep, Integer> {
    
    @Query("SELECT v FROM DumperTreep v WHERE v.omobile = :mobile")
    List<DumperTreep> findAllByOwnerMobile(@Param("mobile") String mobile);
}

