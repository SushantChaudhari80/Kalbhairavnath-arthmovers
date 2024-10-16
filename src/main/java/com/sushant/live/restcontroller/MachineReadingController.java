package com.sushant.live.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

//import com.sushant.live.service.MachineReadingService;

import java.io.IOException;

@RestController
@RequestMapping("/upload")
public class MachineReadingController {

//    @Autowired
//    private MachineReadingService machineReadingService;

    @PostMapping
    public String handleFormSubmit(
            @RequestParam("driverMobile") String driverMobile,
            @RequestParam("ownerMobile") String ownerMobile,
            @RequestParam("machineNumber") String machineNumber,
            @RequestParam(value = "readingType", required = false) String[] readingTypes,
            @RequestParam("photo") MultipartFile photo) {
        try {
            // Process photo to extract numbers using OCR (e.g., Tesseract)
//            String extractedText = machineReadingService.extractTextFromImage(photo);
//
//            // Save form data to the database
//            machineReadingService.saveReading(driverMobile, ownerMobile, machineNumber, readingTypes, extractedText);
            
            return "Machine reading submitted successfully!";
        } catch (Exception e) {
            return "Error processing the form: " + e.getMessage();
        }
    }
}
