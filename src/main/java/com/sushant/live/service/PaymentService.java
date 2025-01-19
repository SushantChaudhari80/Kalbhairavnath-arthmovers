package com.sushant.live.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.mapper.PaymentHistoryMapper;
import com.sushant.live.model.DumperTreep;
import com.sushant.live.model.MachineReading;
import com.sushant.live.model.Payments;
import com.sushant.live.repository.DumperTreepRepository;
import com.sushant.live.repository.PaymentRepository;
import com.sushant.live.repository.ReadingRepository;
import com.sushant.live.util.SessionManager;

@Service
public class PaymentService {
	
	@Autowired(required = true)
	PaymentRepository repo;
	
	@Autowired(required=true) 
	ReadingRepository readingSrvice;
	
	@Autowired(required=true) 
	DumperTreepRepository dumperService;
	
	public List<Payments> getAll(String onwerMobile){
		return repo.getByOnwer(onwerMobile);
	}
	public List<String> getAllCustomerNames(String onwerMobile){
		List<Payments> list = repo.getByOnwer(onwerMobile);
		List<String> customerNames = new ArrayList();
		for(Payments p : list) {
			if (!customerNames.contains(p.getCustomerName())) {
				customerNames.add(p.getCustomerName());
			}
			}
			
		return customerNames;
	}
	
	public String addNew(Payments payment){
		try {
			repo.save(payment);
			return "Payment Added Successfully";
		}catch(Exception e) {
			return e.getLocalizedMessage();
		}
	}
	public List<PaymentHistoryMapper> getMachineReadingHistory(String cName) {
		List<MachineReading> unBilledreading=readingSrvice.getByCustomerName(SessionManager.getInstance().getUsername() ,cName);
		List<PaymentHistoryMapper> table1Data =  new ArrayList();
		for(MachineReading rr : unBilledreading ) {
			PaymentHistoryMapper temp = new PaymentHistoryMapper();
			temp.setId(rr.getId());
			temp.setDate(rr.getDate());
			temp.setCustomer_name(rr.getOrderName());
			temp.setV_number(rr.getMachineNumber());
			float totalHour = 0;
			try {
				totalHour = Float.parseFloat(rr.getEndReading()) - Float.parseFloat(rr.getStartReading());
			}catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
			}
			temp.setTotal(totalHour+"");
			int rate=2000;
			temp.setRate(rate+"");
			temp.setTotal_payment((totalHour * rate)+"");
			table1Data.add(temp);
		}
		return table1Data;
	}
	public List<PaymentHistoryMapper> getDumperPaymentHistory(String cName) {
		List<DumperTreep> treeps = dumperService.getByName(SessionManager.getInstance().getUsername(), cName);
		List<PaymentHistoryMapper> table1Data =  new ArrayList();
		for(DumperTreep rr : treeps ) {
			PaymentHistoryMapper temp = new PaymentHistoryMapper();
			temp.setId(rr.getId());
			temp.setDate(rr.getCreateDate());
			temp.setCustomer_name(rr.getCustomerName());
			temp.setV_number(rr.getSelectedVehicle());
			temp.setTotal(rr.getSoilBrass());
			temp.setRate(rr.getSoilRate());
			temp.setTotal_payment(rr.getTotalPayment());
			table1Data.add(temp);
		}
		return table1Data;
	}
	public List<Payments> getPaidPaymentHistory(String cName){
		List<Payments> list = repo.getByCustomerName(SessionManager.getInstance().getUsername(), cName);
		System.out.println("Service + : "+list.get(0).toString());
		return list;
	}

}
