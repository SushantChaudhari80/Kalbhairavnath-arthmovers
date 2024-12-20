package com.sushant.live.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.model.DumperTreep;
import com.sushant.live.repository.DumperTreepRepository;
import com.sushant.live.util.SessionManager;

@Service
public class DumperTreepService {
	
	@Autowired
	DumperTreepRepository repo;
	
	public String addTreep(DumperTreep treep) {
		try {
			repo.save(treep);
			return "Treep Added Successfully.";
		}catch(Exception e) {
			return e.getLocalizedMessage();
		}
	}
	
	public List<DumperTreep> getAll(){
		return repo.findAllByOwnerMobile(SessionManager.getInstance().getUsername());
	}

}
