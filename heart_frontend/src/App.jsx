import { BrowserRouter, Route, Routes } from "react-router-dom";
import "./App.css";
import LoginPage from "./pages/auth/LoginPage";
import SignupPage from "./pages/auth/SignupPage";
import ForgotPasswordPage from "./pages/auth/ForgotPasswordPage";
import PasswordResetEmailPage from "./pages/auth/PasswordResetEmailPage";
import VerifyEmailAddressPage from "./pages/auth/VerifyEmailAddressPage";
import DashboardPage from "./pages/DashboardPage";
import HomeComponent from "./components/specific/DashboardPage/HomePage/HomeComponent";
import SearchComponent from "./components/specific/DashboardPage/SearchPage/SearchComponent";
import AddPostComponent from "./components/specific/DashboardPage/AddPostPage/AddPostComponent";
import InboxComponent from "./components/specific/DashboardPage/InboxPage/InboxComponent";
import ProfileComponent from "./components/specific/DashboardPage/ProfilePage/ProfileComponent";
import SettingsComponent from "./components/specific/DashboardPage/SettingsPage/SettingsComponent";
import LogoutComponent from "./components/specific/DashboardPage/LogoutPage/LogoutComponent";
import NotificationsComponent from "./components/specific/DashboardPage/NotificationsPage/NotificationsComponent";
import ProtectedRoute from "./ProtectedRoute";
import { useSelector } from "react-redux";

function App() {
  const isServerDown = useSelector((state) => state.server.isServerDown);
  if (isServerDown) {
    return <h1>Server Down. Please Try again later. </h1>;
  }
  return (
    <BrowserRouter>
      <Routes>
        {/** auth */}
        <Route path="/auth/login" Component={LoginPage} />
        <Route path="/auth/signup" Component={SignupPage} />
        <Route path="/auth/forgot-password" Component={ForgotPasswordPage} />
        <Route
          path="/auth/password-reset-email"
          Component={PasswordResetEmailPage}
        />
        <Route
          path="/auth/verify-email-address"
          Component={VerifyEmailAddressPage}
        />
        {/** Protected Routes */}
        <Route element={<ProtectedRoute />}>
          <Route path="/" Component={DashboardPage}>
            {/** home */}
            <Route path="home" Component={HomeComponent} />
            <Route path="search" Component={SearchComponent} />
            <Route path="add-post" Component={AddPostComponent} />
            <Route path="inbox" Component={InboxComponent} />
            <Route path="profile" Component={ProfileComponent} />
            <Route path="settings" Component={SettingsComponent} />
            <Route path="log-out" Component={LogoutComponent} />
            <Route path="notifications" Component={NotificationsComponent} />
          </Route>
        </Route>
        <Route path="*" element={<h1>404 Page Not Found</h1>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
