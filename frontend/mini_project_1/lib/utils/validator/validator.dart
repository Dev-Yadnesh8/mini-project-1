class Validator{
  // Validator for email
 static  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

 static  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

 static String? validateMobileNumber(String? value) {
   if (value == null || value.isEmpty) {
     return 'This field cannot be empty';
   } else if (value.length != 10) {
     return 'Mobile number must be exactly 10 digits';
   } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
     return 'Mobile number must contain only digits';
   }
   return null;
 }

 // Validator for password
 static String? validatePassword(String? value) {
   if (value == null || value.isEmpty) {
     return 'Please enter your password';
     }
  //  } else if (value.length < 6) {
  //    return 'Password must be at least 8 characters long';
  //  } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
  //    return 'Password must contain at least one uppercase letter';
  //  } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
  //    return 'Password must contain at least one lowercase letter';
  //  } else if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
  //    return 'Password must contain at least one digit';
  //  } else if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) {
  //    return 'Password must contain at least one special character (!@#\$&*~)';
  //  }
   return null;
 }

 // Validator for confirm password
 static String? validateConfirmPassword(String? value, String? originalPassword) {
   if (value == null || value.isEmpty) {
     return 'Please confirm your password';
   } else if (value != originalPassword) {
     return 'Passwords do not match';
   }
   return null;
 }
}