package com.sushant.live.dto;

import jakarta.validation.constraints.NotNull;

public record StatusRequest(
    @NotNull
    IncidentStatus status
) {
    public enum IncidentStatus {
        Open, In_Progress, Resolved
    }
}
