package com.heart_backend.heart.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * LogoutRequestDTO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogoutRequestDTO {

    private String sessionId;
}
