import 'package:get/get.dart';

myvalidat(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valide username";
    }
  }

  /* if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valide email";
    }
  }*/

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valide phone number";
    }
  }

  if (val.isEmpty) {
    return "can't be empty";
  }

  if (val.length < min) {
    return "the length must be large than $min";
  }

  if (val.length > max) {
    return "the length must be small than $max ";
  }
}
