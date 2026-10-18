package com.sushant.live.service.ai;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
public class IncidentClient {

    private final RestTemplate restTemplate;
    private final String incidentApiUrl;

    public IncidentClient(
            @Value("${incident.api-url:http://localhost:8081/api/incidents}")
            String incidentApiUrl) {

        this.restTemplate = new RestTemplate();
        this.incidentApiUrl = incidentApiUrl;
    }

    public Map<?, ?> createIncident(
            String title,
            String category,
            String priority,
            String description) {

        Map<String, Object> payload = Map.of(
                "title", title,
                "category", category,
                "priority", priority,
                "createdBy", "ChatBot",
                "description", description
        );

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<Map<String, Object>> request =
                new HttpEntity<>(payload, headers);

        ResponseEntity<Map> response = restTemplate.exchange(
                incidentApiUrl,
                HttpMethod.POST,
                request,
                Map.class
        );

        Map<?, ?> body = response.getBody();

        if (!response.getStatusCode().is2xxSuccessful()
                || body == null
                || body.get("id") == null) {

            throw new IllegalStateException(
                    "Incident API did not confirm incident creation");
        }

        return body;
    }
}