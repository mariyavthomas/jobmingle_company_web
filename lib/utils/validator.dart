class Validator {
  //-----------------------------------email---------------------------
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    // Regular expression for validating an email address
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  //-----------------------------------name---------------------------
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Companyname';
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
//-----------------------------------Password---------------------------
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
  //-----------------------------------job title---------------------------
    String? jobtitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your job title';
    }

    return null;
  }
  //-----------------------------------Location---------------------------
    String? location(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Location';
    }

    return null;
  }
  //-----------------------------------No of opening---------------------------
    String? numberofopening(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Number of Opening';
    }

    return null;
  }

  //-----------------------------------Contact person name---------------------------
    String? contactpersonname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Contact person Name';
    }

    return null;
  }

  //-----------------------------------Decripation of job---------------------------
    String? decripationofjob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enterDecripation';
    }

    return null;
  }
//-----------------------------------skills---------------------------
    String? skill(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Skills';
    }

    return null;
  }
  //-----------------------------------date---------------------------
   String? date(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }

    // Regular expression for date format MM/DD/YYYY
    String pattern = r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$';

    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid date in MM/DD/YYYY format';
    }

    return null;
  }
  //-----------------------------------Time---------------------------

   String? time(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a time';
    }

    // Regular expression for time format HH:MM (24-hour)
    String pattern = r'^([01][0-9]|2[0-3]):[0-5][0-9]$';


    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid time in HH:MM format';
    }

    return null;
  }

 //-----------------------------------joaddress---------------------------
   String? jobAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a job address';
    }

    // Regular expression for job address format (allows alphanumeric, spaces, commas, periods, and hyphens)
    String pattern = r'^[a-zA-Z0-9\s,.-]+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid job address';
    }

    return null;
  }
  //-----------------------------------experience---------------------------
   String? experience(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your experience';
    }

    // Regular expression for experience format (e.g., '5 years', '3 months')
    String pattern = r'^\d+\s*(years?|months?)$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid experience format (e.g., "5 years", "3 months")';
    }

    return null;
  }
//-----------------------------------contactpersonprofile---------------------------
    String? contactpersonprofile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Contact Person Profile';
    }

    return null;
  }
String? jobtime(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Correct Time';
  }

  // Regular expression to validate the time range and day format
  final regex = RegExp(
      r'^\b(0[1-9]|1[0-2]):[0-5][0-9] (AM|PM) - (0[1-6]):[0-5][0-9] (AM|PM) \| (Monday|Tuesday|Wednesday|Thursday|Friday|Saturday) to (Monday|Tuesday|Wednesday|Thursday|Friday|Saturday)\b$');

  if (!regex.hasMatch(value)) {
    return 'Invalid time range or day format. Please enter a time range in the format 09:30 AM - 06:30 PM | Monday to Saturday.';
  }

  return null;
}
//-------qulification--------//
String ?qulification(String ?value){
   if (value == null || value.isEmpty) {
    return 'Please enter qulification';
  }
  return null;
}

//------skill----------------------//
String ?salary(String ?value){
   if (value == null || value.isEmpty) {
    return 'Please enter salary';
  }
  return null;
}


}
