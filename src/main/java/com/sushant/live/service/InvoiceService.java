package com.sushant.live.service;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sushant.live.dto.InvoiceDTO;
import com.sushant.live.model.InvoiceTemplate;
import com.sushant.live.repository.InvoiceRepository;
import com.sushant.live.repository.PaymentRepository;
import com.sushant.live.util.SessionManager;

@Service
public class InvoiceService {
	
	
	@Autowired
	PaymentRepository paymentRepo;
	
	@Autowired
	InvoiceRepository repo;
	
	private static final String PREFIX = "INC";
    private static final String SUFFIX_FORMAT = "%04d"; // Ensures numbers are 4 digits (e.g., 0001)
    private AtomicInteger counter;

	
	public String getAmount(String cName) {
		return paymentRepo.getTotalAmt(SessionManager.getInstance().getUsername(), cName);
	}
	
	public List<InvoiceTemplate> getAll() {
		List<InvoiceTemplate> list = repo.getByOmobile(SessionManager.getInstance().getUsername());
		return list;
	}
	
	
	public String saveInvoice(InvoiceDTO dto) {
	    if (dto == null || dto.getInvoice() == null || dto.getBilledDate() == null) {
	        throw new IllegalArgumentException("Invalid invoice data");
	    }

	    InvoiceTemplate template = new InvoiceTemplate();
	    template.setID(getInvoiceNumber());
	    template.setBilledDate(dto.getBilledDate());
	    template.setInvoice(dto.getInvoice());
	    template.setOmobile(SessionManager.getInstance().getUsername());

	    repo.save(template);
	    return "Invoice Saved Successfully";
	}

    public String getInvoiceNumber() {
    	return "INV" + System.currentTimeMillis();
    }
    
    public String getInvoiceById(String id) {
    	try {
    		InvoiceTemplate template = repo.getById(SessionManager.getInstance().getUsername(),id);
    		return template.getInvoice();
    	}catch(Exception e) {
    		e.printStackTrace();
    		return e.getLocalizedMessage();
    	}
    }
}
