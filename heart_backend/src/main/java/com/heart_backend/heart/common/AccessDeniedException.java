package com.heart_backend.heart.common;

/**
 * AccessDeniedException
 */
public class AccessDeniedException extends RuntimeException {
    public AccessDeniedException(String message) {
        super(message);
    }
}