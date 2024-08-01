package com.heart_backend.heart.config;

import java.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.dto.RequestMetaData;
import com.heart_backend.heart.entity.Session;
import com.heart_backend.heart.repository.SessionRepository;
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
    private SessionRepository sessionRepository;

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
        if (!(request.getRequestURI().contains("auth"))) {
            if (auth != null && auth.startsWith("Bearer ")) {
                token = auth.substring(7);
                Session session = sessionRepository.findBySessionId(request.getHeader("SESSION_ID"));
                LocalDateTime expirationDateTime = session.getAccessTokenExpirationTime();
                secret = session.getSecretKey();
                if (LocalDateTime.now().isAfter(expirationDateTime)) {
                    APIResponse apiResponse = new APIResponse(HttpStatus.UNAUTHORIZED.value(), "Access token Expired",
                            "true");
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, apiResponse.toString());
                }
                try {
                    Claims claims = jwtUtil.verify(token, secret);

                    requestMetaData.setId(claims.getIssuer().toString());
                    requestMetaData.setUsername(claims.get("sub").toString());
                } catch (Exception e) {
                    APIResponse apiResponse = new APIResponse(HttpStatus.UNAUTHORIZED.value(), "Invalid Access Token",
                            "true");
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, apiResponse.toString());
                    return false;
                }
            } else {
                APIResponse apiResponse = new APIResponse(HttpStatus.UNAUTHORIZED.value(), "Invalid Access Token",
                        "true");
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, apiResponse.toString());
                return false;
            }
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }

}
