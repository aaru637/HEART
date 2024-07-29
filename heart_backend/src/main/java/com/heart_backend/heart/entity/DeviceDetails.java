package com.heart_backend.heart.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DeviceDetails
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "DEVICE_DETAILS")
public class DeviceDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "DEVICE_DETAILS_ID")
    @NotBlank
    private String deviceDetailsId;

    @Column(name = "IP_ADDRESS")
    private String ipAddress;

    @Column(name = "USER_AGENT")
    private String userAgent;

    @Column(name = "BROWSER")
    private String browser;

    @Column(name = "CPU")
    private String cpu;

    @Column(name = "DEVICE")
    private String device;

    @Column(name = "ENGINE")
    private String engine;

    @Column(name = "PLATFORM")
    private String platform;

    @Column(name = "LANGUAGE")
    private String language;

    @Column(name = "TIMEZONE")
    private String timeZone;
}
