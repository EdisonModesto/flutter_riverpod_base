class ValueValidator {
  static bool isValidEmail(String email) {
    // Use a regular expression to validate the email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    // Password should have at least 8 characters and contain at least one uppercase letter, one lowercase letter, and one digit
    final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static bool isValidPhilippineContactNumber(String number) {
    // Philippine contact numbers should start with a +63 or 0 and have 10 digits
    final contactNumberRegex = RegExp(r'^(?:\+63|0)\d{10}$');
    return contactNumberRegex.hasMatch(number);
  }
}
