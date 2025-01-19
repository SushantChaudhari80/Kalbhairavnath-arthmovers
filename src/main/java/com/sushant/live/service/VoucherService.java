package com.sushant.live.service;

import com.sushant.live.model.Vouchers;
import com.sushant.live.repository.VoucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VoucherService {

    @Autowired
    private VoucherRepository voucherRepository;

    // Fetch all vouchers
    public List<Vouchers> getAllVouchers() {
        return voucherRepository.findAll();
    }

    // Add a new voucher
    public Vouchers addVoucher(Vouchers voucher) {
        return voucherRepository.save(voucher);
    }

    // Find a voucher by ID (optional)
    public Vouchers getVoucherById(int id) {
        return voucherRepository.findById(id).orElse(null);
    }

    // Delete a voucher by ID
    public void deleteVoucherById(int id) {
        voucherRepository.deleteById(id);
    }
}
