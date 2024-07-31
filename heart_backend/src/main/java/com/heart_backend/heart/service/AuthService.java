package com.heart_backend.heart.service;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;
import java.util.List;

import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.dto.AuthResponseDTO;
import com.heart_backend.heart.dto.SignUpRequestDTO;
import com.heart_backend.heart.entity.DeviceDetails;
import com.heart_backend.heart.entity.LoginSession;
import com.heart_backend.heart.entity.User;
import com.heart_backend.heart.entity.UserProfile;
import com.heart_backend.heart.repository.DeviceDetailsRepository;
import com.heart_backend.heart.repository.LoginSessionRepository;
import com.heart_backend.heart.repository.UserProfileRepository;
import com.heart_backend.heart.repository.UserRepository;
import com.heart_backend.heart.util.JwtUtil;
import com.heart_backend.heart.util.LocalDateTimeFormatter;

import jakarta.servlet.http.HttpServletRequest;

/**
 * AuthService
 */
@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserProfileRepository userProfileRepository;

    @Autowired
    private LoginSessionRepository loginSessionRepository;

    @Autowired
    private DeviceDetailsRepository deviceDetailsRepository;

    @Autowired
    private JwtUtil jwtUtil;

    @Transactional
    public APIResponse signup(SignUpRequestDTO signUpRequestDTO, HttpServletRequest request)
            throws BadRequestException {

        APIResponse apiResponse = new APIResponse();

        /*
         * ID Generators
         */
        String userId = UUID.randomUUID().toString().replace("-", "");
        String sessionId = UUID.randomUUID().toString().replace("-", "");
        String secret = UUID.randomUUID().toString().replace("-", "");

        try {

            /*
             * UserProfile table
             */
            UserProfile profile = new UserProfile();
            profile.setUserProfileId(userId);
            profile.setFullName(signUpRequestDTO.getFullName());

            profile = userProfileRepository.save(profile);

            /*
             * User Table
             */
            User user = new User();
            user.setUserId(userId);
            user.setUsername(signUpRequestDTO.getUsername());
            user.setPassword(signUpRequestDTO.getPassword());
            user.setProfile(profile);

            /*
             * to generate access and refresh tokens
             */

            Map<String, Object> result = jwtUtil.generateJWTToken(userId, secret, user.getUsername());

            /*
             * DeviceDetails Table
             */
            DeviceDetails deviceDetails = new DeviceDetails();
            deviceDetails.setDeviceDetailsId(sessionId);
            deviceDetails.setIpAddress(ipAddressGetter(request));
            deviceDetails.setUserAgent(signUpRequestDTO.getUserAgent());
            deviceDetails.setBrowser(signUpRequestDTO.getBrowser());
            deviceDetails.setCpu(signUpRequestDTO.getCpu());
            deviceDetails.setDevice(signUpRequestDTO.getDevice());
            deviceDetails.setEngine(signUpRequestDTO.getEngine());
            deviceDetails.setLanguage(signUpRequestDTO.getLanguage());
            deviceDetails.setPlatform(signUpRequestDTO.getPlatform());
            deviceDetails.setTimeZone(signUpRequestDTO.getTimeZone());

            deviceDetails = deviceDetailsRepository.save(deviceDetails);

            /*
             * LoginSession Table
             */
            LoginSession session = new LoginSession();
            session.setSessionId(sessionId);
            session.setUser(user);
            session.setAccessToken(result.get("accessToken").toString());
            session.setRefreshToken(result.get("refreshToken").toString());
            session.setAccessTokenExpirationTime(
                    LocalDateTimeFormatter.objectToLocalDateTime(result.get("accessTokenExpiryTime")));
            session.setRefreshTokenExpirationTime(
                    LocalDateTimeFormatter.objectToLocalDateTime(result.get("refreshTokenExpiryTime")));
            session.setSecretKey(secret);
            session.setDeviceDetails(deviceDetails);

            session = loginSessionRepository.save(session);

            /*
             * To set the session data in user table
             */
            user.setSessions(new ArrayList<>(List.of(session)));
            user = userRepository.save(user);

            /*
             * response setter
             */
            apiResponse.setStatus(HttpStatus.OK.value());
            apiResponse.setData(new AuthResponseDTO(user.getUserId(), session.getAccessToken(),
                    session.getRefreshToken(), session.getSessionId()));
            apiResponse.setError("false");
        } catch (Exception e) {
            apiResponse.setError("true");
            apiResponse.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
            throw new BadRequestException("Error Ocuured while Signup : " + signUpRequestDTO);
        }

        return apiResponse;
    }

    /*
     * IP Address Getter
     */
    private String ipAddressGetter(HttpServletRequest request) {

        String ipAddress = request.getRemoteAddr();
        System.out.println(ipAddress);
        System.out.println(request.getRemoteAddr());
        String forwardedIp = request.getHeader("X-Forwarded-For");

        if (forwardedIp != null && !forwardedIp.isEmpty()) {
            ipAddress = forwardedIp.split(",")[0];
            System.out.println(ipAddress);
        }
        return ipAddress;
    }

}
