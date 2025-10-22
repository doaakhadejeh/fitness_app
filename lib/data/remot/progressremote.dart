import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Progressdata {
  Cud cud;
  Progressdata(this.cud);

  getProgress(String token) async {
    var response = await cud.getdatasecure(Applink.progress, token);
    return response.fold((l) => l, (r) => r);
  }
}
