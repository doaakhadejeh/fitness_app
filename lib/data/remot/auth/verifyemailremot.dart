import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Verifyemaildata {
  Cud cud = Cud();

  Verifyemaildata(this.cud);

  postdata(String email, String veryemail) async {
    var response = await cud.postdata(Applink.verifyemail, {
      "email": email,
      "code": veryemail,
    });
    return response.fold((l) => l, (r) => r);
  }

  resenddata(String email) async {
    var response = await cud.postdata(Applink.resendverifyemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
