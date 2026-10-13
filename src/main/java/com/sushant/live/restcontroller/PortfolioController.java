package com.sushant.live.restcontroller;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.sushant.live.service.PortfolioService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@RestController
@RequestMapping("/api/portfolio")
@Validated
public class PortfolioController {

	@Autowired
    private  PortfolioService portfolioService;

    @GetMapping
    public ObjectNode getPortfolio(
        @RequestParam
        @NotBlank(message = "Customer name is required")
        @Size(max = 200, message = "Customer name is too long")
        String customerName
    ) {
        return portfolioService.getPortfolio(customerName);
    }
}
