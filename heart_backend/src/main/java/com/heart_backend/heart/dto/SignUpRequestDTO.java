package com.heart_backend.heart.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * SignUpRequestDTO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignUpRequestDTO {
    private String username;
    private String email;
    private String fullName;
    private String password;
    private String ipAddress;
    private String userAgent;
    private String platform;
    private String language;
    private String timeZone;
    private String browser;
    private String cpu;
    private String device;
    private String engine;
}
