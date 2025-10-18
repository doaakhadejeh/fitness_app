import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Profiledata {
  Cud cud;
  Profiledata(this.cud);

  changepassword(String token, Map data) async {
    var response = await cud.putdatasecure(Applink.changepassword, token, data);
    return response.fold((l) => l, (r) => r);
  }

  updateprofile(String token, Map data) async {
    var response = await cud.putdatasecure(Applink.updateprogile, token, data);
    return response.fold((l) => l, (r) => r);
  }
}
