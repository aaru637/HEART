package com.heart_backend.heart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.heart_backend.heart.entity.User;

/**
 * UserRepository
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query
    User findByUsernameAndPassword(String username, String password);

    @Query
    User findByUsername(String username);

}
