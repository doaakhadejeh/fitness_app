import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Trainercontroldata {
  Cud cud = Cud();

  Trainercontroldata(this.cud);

  getusertr(String token) async {
    var response = await cud.getdatasecure(Applink.listtraineruser, token);
    return response.fold((l) => l, (r) => r);
  }

  getuser(String token) async {
    var response = await cud.getdatasecure(Applink.listadminUsers, token);
    return response.fold((l) => l, (r) => r);
  }

  adduser(String token, id) async {
    var response =
        await cud.postdatasecure(Applink.addTraineuser, token, {"user_id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteuser(String token, id) async {
    var response = await cud.deletedatasecure(Applink.deleteTruser(id), token);
    return response.fold((l) => l, (r) => r);
  }
}
