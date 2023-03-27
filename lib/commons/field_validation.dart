class FieldValidation {
  static String? validateTextField(String? value, String fieldName,
      {int maxLength = 100, int minLength = 3}) {
    print("**** inside validateTextField");
    if (value == null || value.isEmpty) {
      print('$fieldName cannot be empty');
      return '$fieldName cannot be empty';
    }
    if (value.length > maxLength || value.length < minLength) {
      print('$fieldName must be minimum of $minLength and maximum of $maxLength characters');
      return '$fieldName must be minimum of $minLength and maximum of $maxLength characters';
    }

    if (fieldName.toLowerCase().contains("mobile") ||
        fieldName.toLowerCase().contains("phone")) {
      RegExp regex = RegExp(r'^\+?[ ]?\d{0,3}[ -]?\d{3}[ -]?\d{3}[ -]?\d{4}$');
      if (!regex.hasMatch(value)) {
        print('Invalid mobile number format');
        return 'Invalid mobile number format';
      }
    } else if (fieldName.toLowerCase().contains("email")) {
      RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
      if (!regex.hasMatch(value)) {
        print('Invalid email address format');
        return 'Invalid email address format';
      }
    } else {
      RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
      if (!regex.hasMatch(value)) {
        return '$fieldName can only contain alphanumeric characters'; 
      }
      return null;
    }
  }
}
