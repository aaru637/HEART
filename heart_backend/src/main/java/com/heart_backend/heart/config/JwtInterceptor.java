package com.heart_backend.heart.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.heart_backend.heart.dto.RequestMetaData;
import com.heart_backend.heart.repository.LoginSessionRepository;
import com.heart_backend.heart.util.JwtUtil;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * JwtInterceptor
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private LoginSessionRepository sessionRepository;

    private RequestMetaData requestMetaData;

    public JwtInterceptor(RequestMetaData requestMetaData) {
        this.requestMetaData = requestMetaData;
    }

    @SuppressWarnings("null")
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String auth = request.getHeader("Authorization");
        String token, secret;
        if (!(request.getRequestURI().contains("login") || request.getRequestURI().contains("signup"))) {
            if (auth != null && auth.startsWith("Bearer ")) {
                token = auth.substring(7);
                secret = sessionRepository.findBySessionId(request.getHeader("SESSION_ID")).getSecretKey();
                try {
                    Claims claims = jwtUtil.verify(token, secret);

                    requestMetaData.setId(claims.getIssuer().toString());
                    requestMetaData.setUsername(claims.get("sub").toString());
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    return false;
                }
            } else {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return false;
            }
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

}
