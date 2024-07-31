package com.heart_backend.heart.controller;

import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.dto.SignUpRequestDTO;
import com.heart_backend.heart.repository.LoginSessionRepository;
import com.heart_backend.heart.service.AuthService;

import jakarta.servlet.http.HttpServletRequest;

/**
 * AuthController
 */
@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @Autowired
    private LoginSessionRepository loginSessionRepository;

    @PostMapping("/signup")
    public ResponseEntity<APIResponse> signup(@RequestBody SignUpRequestDTO signUpRequestDTO,
            HttpServletRequest request) throws BadRequestException {
        APIResponse apiResponse = authService.signup(signUpRequestDTO, request);
        return ResponseEntity.status(apiResponse.getStatus()).body(apiResponse);
    }

    @GetMapping("/check")
    public ResponseEntity<APIResponse> check(HttpServletRequest request) {
        return ResponseEntity.status(200).body(
                new APIResponse(200, loginSessionRepository.findBySessionId(request.getHeader("sessionId")), "false"));
    }
}