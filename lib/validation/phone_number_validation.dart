bool validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isNotEmpty) {
    return false;
  }
  else if (!regExp.hasMatch(value)) {
    return false;
  }
  else {
    return true;
  }
}