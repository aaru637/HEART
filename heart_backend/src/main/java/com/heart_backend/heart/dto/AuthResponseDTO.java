package com.heart_backend.heart.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AuthResponseDTO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthResponseDTO {

    private String id;
    private String accessToken;
    private String refreshToken;
}
