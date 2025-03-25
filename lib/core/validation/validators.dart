import 'dart:developer';

String? passwordFieldCheck(String? value) {
  if (value == null || value.isEmpty) {
    return 'The password cannot be empty';
  }
  if (value.length < 8) {
    return 'Must be at least 8 characters long';
  }

  return null;
}

String? emailFieldCheck(String? value) {
  if (value == null || value.isEmpty) {
    return 'The email cannot be empty';
  }
  // Regular expression for basic email validation
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? nationalIdFieldCheck(String? value) {
  if (value == null || value.isEmpty) {
    return 'National Id must not be empty';
  }
  if (value.length != 10) {
    return 'Must be at least 10 numbers long';
  }
  return null;
}

String? nameFieldCheck(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name must not be empty';
  }
  return null;
}

String? phoneNumberFieldCheck(String? value) {
  if (value == null || value.isEmpty) {
    return 'The phone number cannot be empty';
  }

  // Regular expression to match valid phone number patterns
  final validPrefixesRegex = RegExp(r'^(078|079|077|78|79|77)');

  if (!validPrefixesRegex.hasMatch(value)) {
    log('Phone number must start with 078, 079, 077, 78, 79, or 77');
    return 'Phone number must start with 078, 079, 077, 78, 79, or 77';
  }

  // Check the length based on the prefix
  if (value.startsWith('0')) {
    if (value.length != 10) {
      log('Phone number must be 10 digits long if starting with 0');
      return 'Phone number must be 10 digits long if starting with 0';
    }
  } else if (value.startsWith('7')) {
    if (value.length != 9) {
      log('Phone number must be 9 digits long if starting with 7');
      return 'Phone number must be 9 digits long if starting with 7';
    }
  }

  return null; // If everything is valid, return null (no error)
}
