package com.heart_backend.heart.processor;

import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import com.heart_backend.heart.common.APIResponse;
import com.heart_backend.heart.constants.AuthConstants;
import com.heart_backend.heart.dto.AdditionalDetails;
import com.heart_backend.heart.dto.AuthResponseDTO;
import com.heart_backend.heart.dto.LoginRequestDTO;
import com.heart_backend.heart.dto.LogoutRequestDTO;
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

    private static final Logger LOG = LoggerFactory.getLogger(AuthProcessor.class);

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
        LOG.info("ENTERED TO SIGNUP PROCESSOR.");
        try {
            String userId = idGenerator();
            String sessionId = idGenerator();
            String secret = idGenerator();

            /*
             * To save the UserProfile Details
             */
            UserProfile userProfile = saveUserProfile(userId, signUpRequestDTO.getFullName());

            /*
             * To save the User Details
             */
            User user = new User();
            user.setUserId(userId);
            user.setPassword(signUpRequestDTO.getPassword());
            user.setUsername(signUpRequestDTO.getUsername());
            user.setEmail(signUpRequestDTO.getEmail());
            /*
             * To add the User Profile to the User
             */
            user.setProfile(userProfile);
            user = userRepository.save(user);

            /*
             * To save the Device Details
             */
            DeviceDetails deviceDetails = saveDeviceDetails(signUpRequestDTO, sessionId);

            /*
             * To save the Login Session Details
             */
            Session session = saveLoginSession(deviceDetails, user, sessionId, secret);

            /*
             * Configuring API Response
             */
            apiResponse.setStatus(AuthConstants.RESPONSE_OK);
            apiResponse.setData(new AuthResponseDTO(user.getUserId(), session.getAccessToken(),
                    session.getRefreshToken(), session.getSessionId()));
            LOG.info(apiResponse.toString());
            apiResponse.setError(AuthConstants.FAILURE);
        } catch (Exception e) {
            apiResponse.setStatus(AuthConstants.SERVER_ERROR);
            apiResponse.setData(AuthConstants.ERROR_STRING);
            apiResponse.setError(AuthConstants.SUCCESS);
            LOG.error("Error Occured While Signup : ", e.toString());
        }
        LOG.info("EXITED FROM SIGNUP PROCESSOR.");
        return apiResponse;
    }

    /*
     * To perform Login
     */
    @Transactional
    public APIResponse loginProcessor(LoginRequestDTO loginRequestDTO) {
        APIResponse apiResponse = new APIResponse();
        LOG.info("ENTERED TO LOGIN PROCESSOR.");
        try {

            User user = (User) usernameCheckProcessor(loginRequestDTO.getUsername(), true).getData();
            /*
             * To check the username is available or not
             */
            if (user != null) {
                /*
                 * username and password both are matched
                 */
                if (loginRequestDTO.getPassword().equals(user.getPassword())) {

                    /*
                     * To generate Unique ID's
                     */
                    String sessionId = idGenerator();
                    String secret = idGenerator();

                    /*
                     * To store Device Details
                     */
                    DeviceDetails deviceDetails = saveDeviceDetails(loginRequestDTO, sessionId);

                    /*
                     * To store Session Details
                     */
                    Session session = saveLoginSession(deviceDetails, user, sessionId, secret);

                    /*
                     * Configuring API Response
                     */
                    apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                    apiResponse.setData(new AuthResponseDTO(user.getUserId(), session.getAccessToken(),
                            session.getRefreshToken(), session.getSessionId()));
                    apiResponse.setError(AuthConstants.FAILURE);
                } else {
                    apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                    apiResponse.setData(AuthConstants.USERNAME_PASSWORD_NOT_FOUND);
                    apiResponse.setError(AuthConstants.SUCCESS);
                }
            } else {
                apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                apiResponse.setData(AuthConstants.USER_NOT_AVAILABLE);
                apiResponse.setError(AuthConstants.SUCCESS);
            }
        } catch (Exception e) {
            apiResponse.setStatus(AuthConstants.SERVER_ERROR);
            apiResponse.setData(AuthConstants.ERROR_STRING);
            apiResponse.setError(AuthConstants.SUCCESS);
            LOG.error("Error Occured While Login : ", e.toString());
        }
        LOG.info("EXITED FROM LOGIN PROCESSOR.");
        return apiResponse;
    }

    /*
     * To perform logout
     */
    @Transactional
    public APIResponse logoutProcessor(LogoutRequestDTO logoutRequestDTO) {
        LOG.info("ENTERED TO LOGOUT PROCESSOR.");
        APIResponse apiResponse = new APIResponse();
        try {
            Session session = sessionRepository.findBySessionId(logoutRequestDTO.getSessionId());
            if (null != session) {
                if (session.getIsLoggedIn()) {
                    session.setSessionEndTime(LocalDateTime.now());
                    session.setIsLoggedIn(false);
                    sessionRepository.save(session);
                    apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                    apiResponse.setData(AuthConstants.LOGOUT_SUCCESS);
                    apiResponse.setError(AuthConstants.FAILURE);
                } else {
                    apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                    apiResponse.setData(AuthConstants.ALREADY_LOGOUT);
                    apiResponse.setError(AuthConstants.FAILURE);
                }
            } else {
                apiResponse.setStatus(AuthConstants.RESPONSE_OK);
                apiResponse.setData(AuthConstants.LOGOUT_FAILURE);
                apiResponse.setError(AuthConstants.FAILURE);
            }
        } catch (Exception e) {
            LOG.error("Error Occured While Logging out : ", e.toString());
            apiResponse.setStatus(AuthConstants.SERVER_ERROR);
            apiResponse.setData(AuthConstants.ERROR_STRING);
            apiResponse.setError(AuthConstants.FAILURE);
        }
        LOG.info("EXITED FROM LOGOUT PROCESSOR.");
        return apiResponse;
    }

    /*
     * To check username of the user
     */
    public APIResponse usernameCheckProcessor(String username, Boolean innerRequest) {
        APIResponse apiResponse = new APIResponse();
        LOG.info("ENTERED TO USERNAME CHECKER.");
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
            LOG.error("Error Occured While Checking Username : ", e.toString());
        }
        LOG.info("EXITED FROM USERNAME CHECKER.");
        return apiResponse;
    }

    /*
     * To Store UserProfile Details
     */
    private UserProfile saveUserProfile(String userId, String fullName) {
        LOG.info("ENTERED TO SAVING USER PROFILE.");
        UserProfile userProfile = new UserProfile();
        userProfile.setUserProfileId(idGenerator());
        userProfile.setUserId(userId);
        userProfile.setFullName(fullName);
        LOG.info("EXITED FROM SAVING USER PROFILE.");
        return userProfileRepository.save(userProfile);
    }

    /*
     * To Store DeviceDetails
     */
    private DeviceDetails saveDeviceDetails(AdditionalDetails details, String sessionId) {
        LOG.info("ENTERED TO SAVING DEVICE DETAILS.");
        DeviceDetails deviceDetails = new DeviceDetails();
        deviceDetails.setBrowser(details.getBrowser());
        deviceDetails.setCpu(details.getCpu());
        deviceDetails.setDevice(details.getDevice());
        deviceDetails.setSessionId(sessionId);
        deviceDetails.setDeviceDetailsId(idGenerator());
        deviceDetails.setEngine(details.getEngine());
        deviceDetails.setIpAddress(details.getIpAddress());
        deviceDetails.setLanguage(details.getLanguage());
        deviceDetails.setPlatform(details.getPlatform());
        deviceDetails.setTimeZone(details.getTimeZone());
        deviceDetails.setUserAgent(details.getUserAgent());
        LOG.info("EXITED FROM SAVING DEVICE DETAILS.");
        return deviceDetailsRepository.save(deviceDetails);
    }

    /*
     * To Store Login Session Details
     */
    private Session saveLoginSession(DeviceDetails deviceDetails, User user, String sessionId, String secret) {
        LOG.info("ENTERED TO SAVING SESSION.");
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
        LOG.info("EXITED FROM SAVING SESSION.");
        return sessionRepository.save(session);
    }

    /*
     * To generate Unique IDs
     */
    private String idGenerator() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
