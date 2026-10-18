package com.sushant.live.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record ChatRequest(
        @NotBlank
        @Size(max = 100)
        String sessionId,

        @NotBlank
        @Size(max = 10000)
        String message
) {}
