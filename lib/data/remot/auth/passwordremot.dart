import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Passworddata {
  Cud cud = Cud();

  Passworddata(this.cud);

  forgetpassdata(
    String email,
  ) async {
    var response = await cud.postdata(Applink.forgetpass, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  resetpassdata(
    String email,
    String password,
    String compassword,
    String code,
  ) async {
    var response = await cud.postdata(Applink.resetpass, {
      "email": email,
      "password": password,
      "password_confirmation": compassword,
      "code": code,
    });
    return response.fold((l) => l, (r) => r);
  }

  resenddata(String email) async {
    var response = await cud.postdata(Applink.resendverifyemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  //     verypassdata(String email, String password, String name, String conpass,
  //     String phone) async {
  //   var response = await cud.postdata(Applink.verifypass, {
  //     "email": email,
  //     "password": password,
  //     "name": name,
  //     "password_confirmation": conpass,
  //     "phone_number": phone,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
}
