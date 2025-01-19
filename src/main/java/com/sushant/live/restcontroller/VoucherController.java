package com.sushant.live.restcontroller;


import com.sushant.live.model.Vouchers;
import com.sushant.live.service.VoucherService;
import com.sushant.live.util.SessionManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/voucher")
@CrossOrigin(origins = "*") // Allow cross-origin requests for front-end
public class VoucherController {

    @Autowired
    private VoucherService voucherService;

    // Endpoint to fetch all vouchers
    @GetMapping("/getAll")
    public ResponseEntity<List<Vouchers>> getAllVouchers() {
        List<Vouchers> vouchers = voucherService.getAllVouchers();
        return ResponseEntity.ok(vouchers);
    }

    // Endpoint to add a new voucher
    @PostMapping("/add")
    public ResponseEntity<Vouchers> addVoucher(@RequestBody Vouchers voucher) {
        Vouchers savedVoucher = voucherService.addVoucher(voucher);
        savedVoucher.setoNumber(SessionManager.getInstance().getUsername()); 
        return ResponseEntity.ok(savedVoucher);
    }

    // (Optional) Endpoint to fetch a voucher by ID
    @GetMapping("/{id}")
    public ResponseEntity<Vouchers> getVoucherById(@PathVariable int id) {
        Vouchers voucher = voucherService.getVoucherById(id);
        if (voucher != null) {
            return ResponseEntity.ok(voucher);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // (Optional) Endpoint to delete a voucher by ID /api/voucher/delete
    @GetMapping("/delete")
    public ResponseEntity<Void> deleteVoucher(@PathVariable int id) {
    	  System.out.println("Deleting Voucher with ID: " + id);
        voucherService.deleteVoucherById(id);
        return ResponseEntity.noContent().build();
    }
}