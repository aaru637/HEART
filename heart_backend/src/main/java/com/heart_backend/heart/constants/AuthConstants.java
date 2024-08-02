package com.heart_backend.heart.constants;

/**
 * AuthConstants
 */
public class AuthConstants {

    private AuthConstants() {
    }

    public static final String USERNAME_PASSWORD_NOT_FOUND = "user-credentials-not-found";
    public static final String USERNAME_AVAILABLE = "username-available";
    public static final String USERNAME_NOT_AVAILABLE = "username-not-available";
    public static final String USER_NOT_AVAILABLE = "user-not-available";
    public static final String ERROR_STRING = "Error Occured. Please Try again Later.";
    public static final String LOGOUT_SUCCESS = "logged-out";
    public static final String ALREADY_LOGOUT = "already-logged-out";
    public static final String LOGOUT_FAILURE = "session-id-not-available";
    public static final String STATUS = "status";
    public static final String SUCCESS = "true";
    public static final String FAILURE = "false";
    public static final Integer RESPONSE_OK = 200;
    public static final Integer CREATED = 204;
    public static final Integer UN_AUTHORIZED = 401;
    public static final Integer NOT_FOUND = 404;
    public static final Integer SERVER_ERROR = 500;
}
