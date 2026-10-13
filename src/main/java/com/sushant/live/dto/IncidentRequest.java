package com.sushant.live.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record IncidentRequest(
    @NotBlank
    @Size(max = 200)
    String title,

    @NotNull
    IncidentCategory category,

    @NotNull
    IncidentPriority priority,
    
    @NotNull
    String createdBy,

    @NotBlank
    @Size(max = 2000)
    String description
) {
    public enum IncidentCategory {
        Vehicle, Driver, Trip, Payment, Application, Other
    }

    public enum IncidentPriority {
        Low, Medium, High, Critical
    }
}
