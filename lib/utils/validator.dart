class Validator {
  //-----------------------------------email---------------------------
 String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  // Regular expression for validating an email address
  String pattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  return null;
}


  //-----------------------------------name---------------------------
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

//-----------------------------------number---------------------------

   String? numberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }

  // Regular expression to validate a 10-digit number
  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    return 'Please enter a valid 10-digit number';
  }

  return null;
}


//-----------------------------------gender---------------------------
  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    List<String> validGenders = ['Male', 'Female', 'Other'];
    if (!validGenders.contains(value)) {
      return 'Please select a valid gender';
    }
    return null;
  }

  String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!RegExp(r'^(?=.[a-z]).{8,}$').hasMatch(value)) {
    return 'Password must include uppercase, lowercase, number, and special character';
  }

  return null;
}


// String? confirmPasswordValidator(String? value, String? originalPassword) {
//   if (value == null || value.isEmpty) {
//     return 'Please confirm your password';
//   }

//   if (value != originalPassword) {
//     return 'Passwords do not match';
//   }

//   return null;
// }

}