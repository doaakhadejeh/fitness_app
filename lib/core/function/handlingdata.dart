import 'package:fitnessapp/core/class/stateerror.dart';

handlingdata(response) {
  if (response is Stateerr) {
    // ignore: avoid_print
    print(response);
    return response;
  } else {
    return Stateerr.success;
  }
}
