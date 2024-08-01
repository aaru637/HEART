package com.heart_backend.heart.dto;

/**
 * LoginRequestDTO
 */
public class LoginRequestDTO extends AdditionalDetails {
    private String username;
    private String password;

    public LoginRequestDTO(String ipAddress, String userAgent, String platform, String language, String timeZone,
            String browser, String cpu, String device, String engine, String username, String password) {
        super(ipAddress, userAgent, platform, language, timeZone, browser, cpu, device, engine);
        this.username = username;
        this.password = password;
    }

    public LoginRequestDTO(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public LoginRequestDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
