package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Vehicale;

@Repository
public interface VehicaleRepository extends JpaRepository<Vehicale , Integer> {

}
