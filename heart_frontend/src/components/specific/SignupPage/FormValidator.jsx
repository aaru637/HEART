// fullname validator
const fullnameValidator = (fullname) => {
  if (fullname === "") {
    return false;
  } else {
    return true;
  }
};

// email validator
const emailValidator = (email) => {
  if (email === "") {
    return false;
  } else {
    return true;
  }
};

// username validator
const usernameValidator = (username) => {
  if (username === "") {
    return false;
  } else {
    return true;
  }
};

// password validator
const passwordValidator = (password) => {
  if (password === "") {
    return false;
  } else {
    return true;
  }
};

export {
  fullnameValidator,
  emailValidator,
  usernameValidator,
  passwordValidator,
};
