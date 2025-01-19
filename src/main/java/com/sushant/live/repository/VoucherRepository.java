package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.Vouchers;

@Repository
public interface VoucherRepository extends JpaRepository<Vouchers ,Integer>{

}
