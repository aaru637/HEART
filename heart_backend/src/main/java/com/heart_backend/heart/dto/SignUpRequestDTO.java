package com.heart_backend.heart.dto;

/**
 * SignUpRequestDTO
 */
public class SignUpRequestDTO extends AdditionalDetails {
    private String username;
    private String email;
    private String fullName;
    private String password;

    public SignUpRequestDTO(String ipAddress, String userAgent, String platform, String language, String timeZone,
            String browser, String cpu, String device, String engine, String username, String email, String fullName,
            String password) {
        super(ipAddress, userAgent, platform, language, timeZone, browser, cpu, device, engine);
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
    }

    public SignUpRequestDTO(String username, String email, String fullName, String password) {
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
    }

    public SignUpRequestDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
