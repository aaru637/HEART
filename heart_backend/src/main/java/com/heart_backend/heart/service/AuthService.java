package com.heart_backend.heart.service;

import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.dto.LoginRequestDTO;
import com.heart_backend.heart.dto.SignUpRequestDTO;
import com.heart_backend.heart.processor.AuthProcessor;
import jakarta.servlet.http.HttpServletRequest;

/**
 * AuthService
 */
@Service
public class AuthService {

    @Autowired
    private AuthProcessor authProcessor;

    /*
     * to handle the sign up
     */
    public APIResponse signup(SignUpRequestDTO signUpRequestDTO, HttpServletRequest request) {
        /*
         * To get IPAddress
         */
        signUpRequestDTO.setIpAddress(ipAddressGetter(request));
        /*
         * To perform Signup
         */
        APIResponse apiResponse = authProcessor.signupProcessor(signUpRequestDTO);

        return apiResponse;
    }

    /*
     * to handle the login
     */
    public APIResponse login(LoginRequestDTO loginRequestDTO, HttpServletRequest request) throws BadRequestException {
        APIResponse apiResponse = new APIResponse();
        /*
         * To get IPAddress
         */
        loginRequestDTO.setIpAddress(ipAddressGetter(request));
        /*
         * To perform Login
         */
        apiResponse = authProcessor.loginProcessor(loginRequestDTO);
        return apiResponse;
    }

    /*
     * IP Address Getter
     */
    private String ipAddressGetter(HttpServletRequest request) {

        String ipAddress = request.getRemoteAddr();
        String forwardedIp = request.getHeader("X-Forwarded-For");

        if (forwardedIp != null && !forwardedIp.isEmpty()) {
            ipAddress = forwardedIp.split(",")[0];
        }
        return ipAddress;
    }

}
