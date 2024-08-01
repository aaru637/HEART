package com.heart_backend.heart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.heart_backend.heart.entity.Session;

/**
 * LoginSessionRepository
 */
@Repository
public interface SessionRepository extends JpaRepository<Session, Long> {

    @Query
    Session findBySessionId(String sessionId);

    @Query
    List<Session> findByUsername(String username);

}
