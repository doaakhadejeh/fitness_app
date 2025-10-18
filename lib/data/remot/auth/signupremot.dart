import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Signupdata {
  Cud cud = Cud();

  Signupdata(this.cud);

  postdata(String email, String password, String name, String conpass,
      String phone) async {
    var response = await cud.postdata(Applink.signin, {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": conpass,
      "phone_number": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
