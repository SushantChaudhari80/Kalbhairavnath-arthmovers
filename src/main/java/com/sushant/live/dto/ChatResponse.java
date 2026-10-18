package com.sushant.live.dto;


import java.util.List;

public record ChatResponse(
        String sessionId,
        String answer,
        List<String> sourceDocuments,
        boolean incidentCreated,
        Object incident
) {}