import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Helthprofdata {
  Cud cud;
  Helthprofdata(this.cud);

  showhelth(String token) async {
    var response = await cud.getdatasecure(Applink.showhelth, token);
    return response.fold((l) => l, (r) => r);
  }

  updatehelth(String token, Map data) async {
    var response = await cud.putdatasecure(Applink.updatehelth, token, data);
    return response.fold((l) => l, (r) => r);
  }

  storehelth(String token, Map data) async {
    var response = await cud.postdatasecure(Applink.createhelth, token, data);
    return response.fold((l) => l, (r) => r);
  }

  completehelth(String token) async {
    var response = await cud.getdatasecure(Applink.completehelth, token);
    return response.fold((l) => l, (r) => r);
  }

  showhelthadmin(String token, userId) async {
    var response =
        await cud.getdatasecure(Applink.showHealthById(userId), token);
    return response.fold((l) => l, (r) => r);
  }

  updatehelthadmin(String token, userId, Map data) async {
    var response =
        await cud.putdatasecure(Applink.showHealthById(userId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  deletehelthadmin(
    String token,
    userId,
  ) async {
    var response =
        await cud.deletedatasecure(Applink.deleteHealthProfile(userId), token);
    return response.fold((l) => l, (r) => r);
  }
}
