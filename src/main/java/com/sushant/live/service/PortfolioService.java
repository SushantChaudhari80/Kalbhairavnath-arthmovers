
package com.sushant.live.service;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sushant.live.repository.PortfolioRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

@Service
public class PortfolioService {

	@Autowired
    private  PortfolioRepository portfolioRepository;

    @Transactional(readOnly = true)
    public ObjectNode getPortfolio(String customerName) {

        if (customerName == null || customerName.isBlank()) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "Customer name is required"
            );
        }

        String normalizedName = customerName.trim();

        return portfolioRepository.findPortfolio(normalizedName)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                "No portfolio found for customer: " + normalizedName
            ));
    }
}
