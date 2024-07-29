import React, { useState } from "react";
import {
  account,
  connect,
  header,
  content,
  logIn,
  signUp,
  agreed,
} from "../../../utils/SignupPageUtils";
import GoogleButton from "../../common/social-media-buttons/GoogleButton";
import FacebookButton from "../../common/social-media-buttons/FacebookButton";
import "react-toastify/dist/ReactToastify.css";
import {
  account_style,
  account_suffix_style,
  connect_style,
  content_style,
  header_style,
  parent_form,
  input_field,
} from "../../common/login-signup-styles/LoginSignupCommonStyles";
import { useNavigate } from "react-router-dom";
import {
  emailValidator,
  fullnameValidator,
  passwordValidator,
  usernameValidator,
} from "./FormValidator";
import { ToastContainer, toast } from "react-toastify";
import toastData from "./../../../utils/toast/toastData";
import { useDispatch, useSelector } from "react-redux";
import { signup } from "../../../actions/AuthAction";
import userAgent, {
  browser,
  cpu,
  device,
  engine,
  language,
  platform,
  timeZone,
} from "../../../services/additional-service/AdditionalService";

const SignupForm = () => {
  let navigate = useNavigate();
  const dispatch = useDispatch();
  const isAuthenticated = useSelector((state) => state.auth.isAuthenticated);
  const [formData, setFormData] = useState({
    fullName: {
      value: "",
      status: false,
    },
    email: {
      value: "",
      status: false,
    },
    username: {
      value: "",
      status: false,
    },
    password: {
      value: "",
      status: false,
    },
  });
  const [agree, setAgree] = useState(false);

  const handleInputChange = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: {
        value: event.target.value,
        status: event.target.value === "" ? false : true,
      },
    });
  };

  const handleSignup = () => {
    if (!fullnameValidator(formData.fullName.value)) {
      toast.error("Fullname must not be empty.", toastData);
    } else if (!emailValidator(formData.email.value)) {
      toast.error("Email must not be empty.", toastData);
    } else if (!usernameValidator(formData.username.value)) {
      toast.error("Username must not be empty.", toastData);
    } else if (!passwordValidator(formData.password.value)) {
      toast.error("Password must not be empty.", toastData);
    } else if (!agree) {
      toast.error("You must agree with the Terms and Conditions.", toastData);
    } else {
      const signupData = {
        username: formData.username.value,
        password: formData.password.value,
        fullName: formData.fullName.value,
        email: formData.email.value,
        userAgent: userAgent,
        browser: browser,
        cpu: cpu,
        device: device,
        engine: engine,
        platform: platform,
        language: language,
        timeZone: timeZone,
      };
      dispatch(signup(signupData));
      if (isAuthenticated) {
        clearFormData();
        navigate("/auth/verify-email-address", { replace: true });
      } else {
        toast.error("Error Occured. Please try again later.");
        clearFormData();
      }
    }
  };

  const clearFormData = () => {
    setFormData({
      fullName: {
        value: "",
        status: false,
      },
      email: {
        value: "",
        status: false,
      },
      username: {
        value: "",
        status: false,
      },
      password: {
        value: "",
        status: false,
      },
    });
  };
  return (
    <div className={parent_form}>
      <p className={header_style}>{header}</p>
      <p className={content_style}>{content}</p>
      <input
        type="text"
        name="fullName"
        placeholder="Full name (DHINESHKUMAR D)"
        onChange={handleInputChange}
        value={formData.fullName.value}
        className={`${
          !fullnameValidator(formData.fullName.value)
            ? "border-red-600"
            : "border-blue-600"
        } ${input_field} signup-input-field `}
      />
      <input
        type="text"
        name="email"
        placeholder="Email"
        onChange={handleInputChange}
        value={formData.email.value}
        className={`${input_field} signup-input-field ${
          !emailValidator(formData.email.value)
            ? "border-red-600"
            : "border-blue-600"
        }`}
      />
      <input
        type="text"
        name="username"
        placeholder="Username"
        onChange={handleInputChange}
        value={formData.username.value}
        className={`${input_field} signup-input-field ${
          !usernameValidator(formData.username.value)
            ? "border-red-600"
            : "border-blue-600"
        }`}
      />
      <input
        type="password"
        name="password"
        onChange={handleInputChange}
        value={formData.password.value}
        placeholder="Password"
        className={`${input_field} signup-input-field ${
          !passwordValidator(formData.password.value)
            ? "border-red-600"
            : "border-blue-600"
        }`}
      />
      <div className="flex flex-row items-center w-full md:w-[75%]">
        <input
          type="checkbox"
          name="agree"
          className={`check-box ${
            !agree ? "border-red-600" : "border-blue-600"
          }`}
          onChange={() => setAgree(!agree)}
        />
        &nbsp;{" "}
        <p className="text-sm sm:text-lg md:text-[0.8rem] font-semibold font-sora">
          {agreed}
          <span>
            <a href="#ad" className="text-blue-600 underline">
              Terms
            </a>
            &nbsp; {"and"}
            &nbsp;
            <a href="#fgh" className="text-blue-600 underline">
              Conditions.
            </a>
          </span>
        </p>
      </div>
      <button
        className="sign-up-btn font-sora font-extrabold text-sm md:text-[0.8rem]"
        onClick={handleSignup}
      >
        {signUp}
      </button>
      <p className={connect_style}>{connect}</p>
      <div className="flex justify-evenly w-full">
        <FacebookButton />
        <GoogleButton />
      </div>
      <div>
        <span className={account_style}>{account}</span>
        &nbsp;
        <span
          className={`cursor-pointer ${account_suffix_style}`}
          onClick={() => {
            navigate("/auth/login", {
              replace: true,
            });
          }}
        >
          {logIn}
        </span>
      </div>
      <ToastContainer />
    </div>
  );
};

export default SignupForm;
