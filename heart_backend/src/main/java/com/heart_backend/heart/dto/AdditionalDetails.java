package com.heart_backend.heart.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AdditionalDetails
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdditionalDetails {
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
