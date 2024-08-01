package com.heart_backend.heart.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

/**
 * UserProfile
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "USER_PROFILE", uniqueConstraints = @UniqueConstraint(columnNames = { "USER_PROFILE_ID" }))
public class UserProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "USER_PROFILE_ID")
    @NotBlank
    private String userProfileId;

    @NotBlank
    @Column(name = "FULL_NAME")
    private String fullName;

    @Column(name = "CONTACT")
    private String contact;

    @Column(name = "MODIFIED_AT")
    private LocalDateTime modifiedAt = LocalDateTime.now();

    @Column(name = "BIRTHDAY")
    private LocalDateTime birthday;
}
