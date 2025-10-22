import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Admincontroldata {
  Cud cud = Cud();

  Admincontroldata(this.cud);

  getuser(String token) async {
    var response = await cud.getdatasecure(Applink.listadminUsers, token);
    return response.fold((l) => l, (r) => r);
  }

  gettrainer(String token) async {
    var response = await cud.getdatasecure(Applink.listTrainers, token);
    return response.fold((l) => l, (r) => r);
  }

  addtrainer(String token, Map data) async {
    var response = await cud.postdatasecure(Applink.addTrainer, token, data);
    return response.fold((l) => l, (r) => r);
  }

  //   getadmin(String token) async {
  //   var response = await cud.getdatasecure(Applink., token);
  //   return response.fold((l) => l, (r) => r);
  // }

  addadmin(String token, Map data) async {
    var response = await cud.postdatasecure(Applink.addadmin, token, data);
    return response.fold((l) => l, (r) => r);
  }

  blockuser(String token, id) async {
    var response = await cud.putdatasecure(Applink.blockUser(id), token, {});
    return response.fold((l) => l, (r) => r);
  }

  unblockuser(String token, id) async {
    var response = await cud.putdatasecure(Applink.unblockUser(id), token, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteuser(String token, id) async {
    var response =
        await cud.deletedatasecure(Applink.deleteadminUser(id), token);
    return response.fold((l) => l, (r) => r);
  }

  deletetrainer(String token, id) async {
    var response =
        await cud.deletedatasecure(Applink.deleteadminTrainer(id), token);
    return response.fold((l) => l, (r) => r);
  }
}
