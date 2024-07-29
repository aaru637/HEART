package com.heart_backend.heart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.heart_backend.heart.entity.DeviceDetails;

/**
 * DeviceDetailsRepository
 */
@Repository
public interface DeviceDetailsRepository extends JpaRepository<DeviceDetails, String> {

}
