package com.heart_backend.heart.util;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Map;
import java.util.HashMap;

/**
 * JwtUtil
 */
@Component
public class JwtUtil {

    public Map<String, Object> generateJWTToken(String id, String secret) {
        Map<String, Object> result = new HashMap<>();

        Date accessTokenExpiryTime = Date
                .from(LocalDateTime.now().plusHours(12).atZone(ZoneId.systemDefault()).toInstant());
        Date refreshTokenExpiryTime = Date
                .from(LocalDateTime.now().plusDays(15).atZone(ZoneId.systemDefault()).toInstant());

        /*
         * Claims
         */
        Claims accessTokenClaims = Jwts.claims().setIssuer(id).setIssuedAt(new Date())
                .setExpiration(accessTokenExpiryTime);

        Claims refreshTokenClaims = Jwts.claims().setIssuer(id).setIssuedAt(new Date())
                .setExpiration(refreshTokenExpiryTime);

        /*
         * tokens
         */
        String accessToken = Jwts.builder().setClaims(accessTokenClaims)
                .signWith(SignatureAlgorithm.HS512, secret.getBytes()).compact();
        String refreshToken = Jwts.builder().setClaims(refreshTokenClaims)
                .signWith(SignatureAlgorithm.HS384, id.getBytes()).compact();

        result.put("accessToken", accessToken);
        result.put("refreshToken", refreshToken);
        result.put("accessTokenExpiryTime", accessTokenExpiryTime);
        result.put("refreshTokenExpiryTime", refreshTokenExpiryTime);
        return result;
    }
}
