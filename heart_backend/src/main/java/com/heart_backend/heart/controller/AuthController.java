package com.heart_backend.heart.controller;

import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.dto.LoginRequestDTO;
import com.heart_backend.heart.dto.SignUpRequestDTO;
import com.heart_backend.heart.service.AuthService;
import java.util.Map;
import jakarta.servlet.http.HttpServletRequest;

/**
 * AuthController
 */
@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/signup")
    public ResponseEntity<APIResponse> signup(@RequestBody SignUpRequestDTO signUpRequestDTO,
            HttpServletRequest request) throws BadRequestException {
        APIResponse apiResponse = authService.signup(signUpRequestDTO, request);
        return ResponseEntity.status(apiResponse.getStatus()).body(apiResponse);
    }

    @PostMapping("/login")
    public ResponseEntity<APIResponse> login(@RequestBody LoginRequestDTO loginRequestDTO, HttpServletRequest request)
            throws BadRequestException {
        APIResponse apiResponse = authService.login(loginRequestDTO, request);
        return ResponseEntity.status(apiResponse.getStatus()).body(apiResponse);
    }

    @PostMapping("/username")
    public ResponseEntity<APIResponse> usernameChecker(@RequestBody Map<String, String> requestBody) {
        APIResponse apiResponse = authService.usernameChecker(requestBody);
        return ResponseEntity.status(apiResponse.getStatus()).body(apiResponse);
    }
}