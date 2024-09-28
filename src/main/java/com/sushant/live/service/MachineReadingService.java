package com.sushant.live.service;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class MachineReadingService {

    // Method to extract text from the uploaded image
    public String extractTextFromImage(MultipartFile file) throws IOException {
        
        ITesseract tesseract = new Tesseract();

        // Set the datapath to the `tessdata` directory within resources
        URL resource = getClass().getResource("/tessdata");
        if (resource == null) {
            throw new IOException("tessdata folder not found in the classpath");
        }
        // Convert URL to a valid File path
        Path tessdataPath = Paths.get(resource.getPath());
        tesseract.setDatapath(tessdataPath.toString()); // Ensure this path points to the folder containing tessdata

        // Convert MultipartFile to a temporary file
        File tempFile = convertMultipartFileToFile(file);
        String extractedText = "";

        try {
            // Perform OCR on the temporary file
            extractedText = tesseract.doOCR(tempFile);
        } catch (TesseractException e) {
            throw new IOException("Error extracting text from image", e);
        } finally {
            // Clean up the temporary file
            if (tempFile.exists()) {
                tempFile.delete();
            }
        }

        return extractedText;
    }

    // Helper method to convert MultipartFile to a temporary File
    private File convertMultipartFileToFile(MultipartFile file) throws IOException {
        File tempFile = File.createTempFile("upload", ".png"); // Creates a temporary file
        try (InputStream inputStream = file.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        return tempFile;
    }

    // Method to save reading data to the database
    public void saveReading(String driverMobile, String ownerMobile, String machineNumber, String[] readingTypes, String extractedText) {
        // Implement your logic to save data to the database using JPA or any preferred method
        System.out.println("Saving data: " + driverMobile + ", " + ownerMobile + ", " + machineNumber + ", Reading Types: " + String.join(", ", readingTypes) + ", Extracted Text: " + extractedText);
    }
}
