package com.sushant.live;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.sushant.live.repository.VehicaleRepository;

@Service
public class Config {

    @Autowired
    private static VehicaleRepository repo;

    public static VehicaleRepository getDatasource() { 
       return repo;
    }
}

