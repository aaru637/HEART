package com.heart_backend.heart.processor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.constants.AuthConstants;
import com.heart_backend.heart.dto.AdditionalDetails;
import com.heart_backend.heart.dto.AuthResponseDTO;
import com.heart_backend.heart.dto.LoginRequestDTO;
import com.heart_backend.heart.dto.SignUpRequestDTO;
import com.heart_backend.heart.entity.DeviceDetails;
import com.heart_backend.heart.entity.Session;
import com.heart_backend.heart.entity.User;
import com.heart_backend.heart.entity.UserProfile;
import com.heart_backend.heart.repository.DeviceDetailsRepository;
import com.heart_backend.heart.repository.SessionRepository;
import com.heart_backend.heart.repository.UserProfileRepository;
import com.heart_backend.heart.repository.UserRepository;
import com.heart_backend.heart.util.JwtUtil;
import com.heart_backend.heart.util.LocalDateTimeFormatter;

/**
 * AuthProcessor
 */
@Service
public class AuthProcessor {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserProfileRepository userProfileRepository;

    @Autowired
    private SessionRepository sessionRepository;

    @Autowired
    private DeviceDetailsRepository deviceDetailsRepository;

    @Autowired
    private JwtUtil jwtUtil;

    /*
     * To perform Signup
     */
    @Transactional
    public APIResponse signupProcessor(SignUpRequestDTO signUpRequestDTO) {
        APIResponse apiResponse = new APIResponse();
        try {
            Map<String, String> ids = idGenerator();
            String userId = ids.get("userId");
            String sessionId = ids.get("sessionId");
            String secret = ids.get("secret");

            /*
             * To save the User Details
             */
            User user = new User();
            user.setUserId(userId);
            user.setPassword(signUpRequestDTO.getPassword());
            user.setUsername(signUpRequestDTO.getUsername());
            user.setEmail(signUpRequestDTO.getEmail());

            /*
             * To save the UserProfile Details
             */
            UserProfile userProfile = saveUserProfile(userId, signUpRequestDTO.getFullName());

            /*
             * To save the Device Details
             */
            DeviceDetails deviceDetails = saveDeviceDetails(signUpRequestDTO, sessionId);

            /*
             * To save the Login Session Details
             */
            Session session = saveLoginSession(deviceDetails, user, sessionId, secret);

            /*
             * To add the session to the User
             */
            user.setSessions(new ArrayList<>() {
                {
                    add(session);
                }
            });
            /*
             * To add the User Profile to the User
             */
            user.setProfile(userProfile);

            user = userRepository.save(user);

            /*
             * Configuring API Response
             */
            apiResponse.setStatus(AuthConstants.CREATED);
            apiResponse.setData(new AuthResponseDTO(user.getUserId(), session.getAccessToken(),
                    session.getRefreshToken(), session.getSessionId()));
            apiResponse.setError(AuthConstants.FAILURE);
        } catch (Exception e) {
            apiResponse.setStatus(AuthConstants.SERVER_ERROR);
            apiResponse.setData(AuthConstants.ERROR_STRING);
            apiResponse.setError(AuthConstants.SUCCESS);
            e.printStackTrace();
            // LOG.error("Error Occured While Signup : ", e.toString());
        }
        return apiResponse;
    }

    /*
     * To perform Login
     */
    @Transactional
    public APIResponse loginProcessor(LoginRequestDTO loginRequestDTO) {
        APIResponse apiResponse = new APIResponse();
        try {
            Map<String, String> ids = idGenerator();
            String sessionId = ids.get("sessionId");
            String secret = ids.get("secret");

            User user = (User) usernameCheckProcessor(loginRequestDTO.getUsername(), true).getData();
            System.out.println(user);
            /*
             * To check the username is available or not
             */
            if (user != null) {
                if (loginRequestDTO.getPassword().equals(user.getPassword())) {
                    System.out.println("Username : " + user.getUsername() + " Password : " + user.getPassword());
                } else {

                }
            } else {
                System.out.println(AuthConstants.USERNAME_PASSWORD_NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return apiResponse;
    }

    /*
     * To check username of the user
     */
    public APIResponse usernameCheckProcessor(String username, Boolean innerRequest) {
        APIResponse apiResponse = new APIResponse();
        User user = null;
        try {
            user = userRepository.findByUsername(username);
            if (user == null) {
                apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                apiResponse.setData(innerRequest ? user : AuthConstants.USERNAME_NOT_AVAILABLE);
                apiResponse.setError(AuthConstants.FAILURE);
            } else {
                apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                apiResponse.setData(innerRequest ? user : AuthConstants.USERNAME_AVAILABLE);
                apiResponse.setError(AuthConstants.FAILURE);
            }
        } catch (Exception e) {
            apiResponse.setStatus(AuthConstants.SERVER_ERROR);
            apiResponse.setData(innerRequest ? user : AuthConstants.ERROR_STRING);
            apiResponse.setError(AuthConstants.FAILURE);
        }
        return apiResponse;
    }

    /*
     * To Store UserProfile Details
     */
    private UserProfile saveUserProfile(String userId, String fullName) {
        UserProfile userProfile = new UserProfile();
        userProfile.setUserProfileId(userId);
        userProfile.setFullName(fullName);
        return userProfileRepository.save(userProfile);
    }

    /*
     * To Store DeviceDetails
     */
    private DeviceDetails saveDeviceDetails(AdditionalDetails details, String sessionId) {
        DeviceDetails deviceDetails = new DeviceDetails();
        deviceDetails.setBrowser(details.getBrowser());
        deviceDetails.setCpu(details.getCpu());
        deviceDetails.setDevice(details.getDevice());
        deviceDetails.setDeviceDetailsId(sessionId);
        deviceDetails.setEngine(details.getEngine());
        deviceDetails.setIpAddress(details.getIpAddress());
        deviceDetails.setLanguage(details.getLanguage());
        deviceDetails.setPlatform(details.getPlatform());
        deviceDetails.setTimeZone(details.getTimeZone());
        deviceDetails.setUserAgent(details.getUserAgent());

        return deviceDetailsRepository.save(deviceDetails);
    }

    /*
     * To Store Login Session Details
     */
    private Session saveLoginSession(DeviceDetails deviceDetails, User user, String sessionId, String secret) {
        Map<String, Object> jwtCredentials = jwtUtil.generateJWTToken(user.getUserId(), secret, user.getUsername());
        Session session = new Session();
        session.setSessionId(sessionId);
        session.setUser(user);
        session.setUsername(user.getUsername());
        session.setAccessToken(jwtCredentials.get("accessToken").toString());
        session.setRefreshToken(jwtCredentials.get("refreshToken").toString());
        session.setAccessTokenExpirationTime(
                LocalDateTimeFormatter.objectToLocalDateTime(jwtCredentials.get("accessTokenExpiryTime")));
        session.setRefreshTokenExpirationTime(
                LocalDateTimeFormatter.objectToLocalDateTime(jwtCredentials.get("refreshTokenExpiryTime")));
        session.setSecretKey(secret);
        session.setDeviceDetails(deviceDetails);
        return sessionRepository.save(session);
    }

    /*
     * To generate Unique IDs
     */
    private Map<String, String> idGenerator() {
        String userId = UUID.randomUUID().toString().replace("-", "");
        String sessionId = UUID.randomUUID().toString().replace("-", "");
        String secret = UUID.randomUUID().toString().replace("-", "");

        return new HashMap<>() {
            {
                put("userId", userId);
                put("sessionId", sessionId);
                put("secret", secret);
            }
        };
    }
}
