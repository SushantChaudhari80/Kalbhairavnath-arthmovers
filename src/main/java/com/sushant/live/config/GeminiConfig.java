package com.sushant.live.config;


import com.google.genai.Client;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GeminiConfig {

    @Bean
    public Client geminiClient(
            @Value("${google.ai.api-key}") String apiKey) {

        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException(
                "GOOGLE_API_KEY is not configured"
            );
        }

        return Client.builder()
                .apiKey(apiKey)
                .build();
    }
}