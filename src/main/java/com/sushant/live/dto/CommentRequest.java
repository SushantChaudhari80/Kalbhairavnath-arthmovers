package com.sushant.live.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CommentRequest(
    @NotBlank
    @Size(max = 5000)
    String comment,
    
    @NotBlank
    @Size(max = 5000)
    String commentedBy
) {}
