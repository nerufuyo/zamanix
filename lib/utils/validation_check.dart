class ValidationCheck {
  static String? checkEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (email.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    } else if (email.contains(' ')) {
      return 'Email should not contain spaces';
    }

    return null;
  }

  static String? checkPassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password should be at least 6 characters';
    } else if (password.contains(' ')) {
      return 'Password should not contain spaces';
    }

    return null;
  }

  static String? checkConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required';
    } else if (confirmPassword != password) {
      return 'Password does not match';
    }

    return null;
  }

  static String? checkFullName(String fullName) {
    if (fullName.isEmpty) {
      return 'Full name is required';
    }

    return null;
  }

  static String? checkUsername(String username) {
    if (username.isEmpty) {
      return 'Username is required';
    } else if (username.contains(' ')) {
      return 'Username should not contain spaces';
    }

    return null;
  }
}
