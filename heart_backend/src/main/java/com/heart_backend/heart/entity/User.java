package com.heart_backend.heart.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * User
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity()
@Table(name = "USER", uniqueConstraints = @UniqueConstraint(columnNames = { "USER_ID" }))
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "USER_ID")
    @NotBlank
    private String userId;

    @Column(name = "USERNAME")
    @NotBlank
    private String username;

    @NotBlank
    @Column(name = "PASSWORD")
    private String password;

    @NotBlank
    @Column(name = "EMAIL")
    private String email;

    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "IS_VERIFIED")
    @Type(value = Boolean.class)
    private Boolean isVerified = false;

    @Column(name = "ATTEMPTS_LEFT")
    private Integer attemptsLeft = 3;

    @Type(value = Boolean.class)
    @Column(name = "IS_LOCKED")
    private Boolean isLocked = false;

    @Column(name = "NEXT_ATTEMPT")
    private LocalDateTime nextAttempt;

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn(name = "PROFILE_ID")
    private UserProfile profile;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
    @JsonManagedReference
    private List<Session> sessions;
}
