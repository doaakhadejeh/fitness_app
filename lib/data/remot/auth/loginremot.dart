import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Logindata {
  Cud cud = Cud();

  Logindata(this.cud);

  postdata(String email, String password) async {
    var response = await cud.postdata(Applink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
