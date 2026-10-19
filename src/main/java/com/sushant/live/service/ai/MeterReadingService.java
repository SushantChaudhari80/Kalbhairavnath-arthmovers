package com.sushant.live.service.ai;

import com.google.genai.Client;
import com.google.genai.Client.Builder;
import com.google.genai.types.Content;
import com.google.genai.types.GenerateContentConfig;
import com.google.genai.types.GenerateContentResponse;
import com.google.genai.types.Part;
import com.google.genai.types.Schema;
import com.google.gson.Gson;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;


public class MeterReadingService {
    public record MeterExtraction(double reading) {}

    private final Client client;
    private final Gson gson;
    
    public MeterReadingService() {	
        // The client natively searches for the GOOGLE_API_KEY environment variable.
        // Or you can configure explicitly: Client.builder().apiKey("YOUR_KEY").build();
        this.client = new Builder().apiKey("api_key").build();
        this.gson = new Gson();
    }

    public double extractMeterReading(byte[] imageBytes, String mimeType) throws Exception {
        
        String prompt = """
            You are an automated industrial equipment inspection parser. 
            Analyze the provided digital hour meter display from the vehicle dashboard.
            
            Instructions:
            - Focus exclusively on the main numerical digits displayed on the internal electronic glass screen.
            - Carefully observe markers noting '1/10' or small arrow marks pointing to the last digit to accurately place the decimal place.
            - Ignore peripheral details like surrounding machinery numbers, text markers, or brand logos (Hyundai, SONY, TATA).
            """;

        Part textPart = Part.fromText(prompt);
        Part imagePart = Part.fromBytes(imageBytes, mimeType);
        Content contentPayload = Content.fromParts(textPart, imagePart);
        Schema jsonSchema = Schema.builder()
            .type("object")
            .properties(Map.of(
                "reading", Schema.builder()
                    .type("number")
                    .description("The extracted actual number from the display grid. Keep accurate decimal notation.")
                    .build()
            ))
            .required(List.of("reading"))
            .build();

        GenerateContentConfig config = GenerateContentConfig.builder()
            .responseMimeType("application/json")
            .responseSchema(jsonSchema) 
            .temperature(0.1f)
            .build();

        try {
            GenerateContentResponse response = client.models.generateContent(
                "gemini-2.5-flash",
                contentPayload,
                config
            );

            String jsonText = response.text().trim();

            MeterExtraction extraction = gson.fromJson(jsonText, MeterExtraction.class);
            
            if (extraction == null) {
                throw new IllegalStateException("API returned an empty structure.");
            }

            return extraction.reading();

        } catch (Exception e) {
            throw new Exception("Meter reading extraction failure: " + e.getMessage(), e);
        }
    }
}
