package com.heart_backend.heart.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonSubTypes.Type;

/**
 * LoginSession
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "LOGIN_SESSION")
public class LoginSession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "LOGIN_SESSION_ID")
    @NotBlank
    private String sessionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
    @JsonBackReference
    private User user;

    @Column(name = "SESSION_START_TIME")
    private LocalDateTime sessionStartTime = LocalDateTime.now();

    @Column(name = "SESSION_END_TIME")
    private LocalDateTime sessionEndTime;

    @Column(name = "IS_LOGGED_IN")
    @Type(value = Boolean.class)
    private Boolean isLoggedIn = true;

    @Column(name = "ACCESS_TOKEN")
    private String accessToken;

    @Column(name = "REFRESH_TOKEN")
    private String refreshToken;

    @Column(name = "ACCESS_TOKEN_EXPIRATION_TIME")
    private LocalDateTime accessTokenExpirationTime;

    @Column(name = "REFRESH_TOKEN_EXPIRATION_TIME")
    private LocalDateTime refreshTokenExpirationTime;

    @Column(name = "SECRET_KEY")
    private String secretKey;

    @OneToOne
    @PrimaryKeyJoinColumn(name = "DEVICE_DETAILS_ID")
    private DeviceDetails deviceDetails;

    public String toString() {
        return "[id = " + id + ", userID = " + user.getId() + ", sessionStartTime = " + sessionStartTime
                + ", sessionEndTime = " + sessionEndTime + ", isLoggedIn = " + isLoggedIn + ", accessToken = "
                + accessToken + ", refreshToken = " + refreshToken + ", accessTokenExpirationTime = "
                + accessTokenExpirationTime + ", refreshTokenExpirationTime = " + refreshTokenExpirationTime
                + ", secretKey = " + secretKey + ", [ deviceDetails = " + deviceDetails + "]]";
    }
}