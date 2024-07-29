import React, { useState } from "react";
import {
  account,
  connect,
  header,
  content,
  logIn,
  signUp,
} from "../../../utils/LoginPageUtils";
import GoogleButton from "../../common/social-media-buttons/GoogleButton";
import FacebookButton from "../../common/social-media-buttons/FacebookButton";
import "react-toastify/dist/ReactToastify.css";
import { ToastContainer, toast } from "react-toastify";
import toastData from "../../../utils/toast/toastData";
import {
  account_style,
  account_suffix_style,
  connect_style,
  content_style,
  header_style,
  input_field,
  parent_form,
} from "../../common/login-signup-styles/LoginSignupCommonStyles";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { login } from "../../../actions/AuthAction";

const LoginForm = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const isAuthenticated = useSelector((state) => state.auth.isAuthenticated);
  const [formData, setFormData] = useState({
    username: {
      value: "",
      status: false,
    },
    password: {
      value: "",
      status: false,
    },
  });
  const [remember, setRemember] = useState(false);

  const handleInputChange = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: {
        value: event.target.value,
        status: event.target.value === "" ? false : true,
      },
    });
  };

  const handleLogin = () => {
    if (formData.username.status && formData.password.status) {
      dispatch(
        login({
          username: formData.username.value,
          password: formData.password.value,
        })
      );
      if (isAuthenticated) {
        toast.success("Logged In Successfully", toastData);
      } else {
        clearFormData();
        toast.error("Error occured. Please try again later.");
      }
    } else {
      clearFormData();
      toast.error("Username or Password must not be empty", toastData);
    }
  };

  const clearFormData = () => {
    setFormData({
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
        name="username"
        placeholder="Username"
        onChange={handleInputChange}
        value={formData.username.value}
        className={`input-field ${input_field} ${
          formData.username.status ? "border-blue-600" : "border-red-600"
        }`}
      />
      <input
        type="password"
        name="password"
        onChange={handleInputChange}
        value={formData.password.value}
        placeholder="Password"
        className={`input-field ${input_field} ${
          formData.password.status ? "border-blue-600" : "border-red-600"
        }`}
      />
      <div className="flex justify-between w-full  md:w-[75%]">
        <div className="flex flex-row items-center">
          <input
            type="checkbox"
            name="remember"
            className="check-box"
            onChange={() => setRemember(!remember)}
          />
          &nbsp;{" "}
          <p className="text-sm sm:text-lg md:text-[0.8rem] font-semibold font-sora">
            Remember Me
          </p>
        </div>
        <div
          className="text-sm sm:text-lg md:text-[0.8rem] text-blue-400 font-semibold font-sora cursor-pointer"
          onClick={() => {
            navigate("/auth/forgot-password", { replace: true });
          }}
        >
          Forgot Password ?
        </div>
      </div>
      <button
        className="log-in-btn font-sora font-extrabold text-sm md:text-[0.8rem]"
        onClick={handleLogin}
      >
        {logIn}
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
            navigate("/auth/signup", {
              replace: true,
            });
          }}
        >
          {signUp}
        </span>
      </div>
      <ToastContainer />
    </div>
  );
};

export default LoginForm;
