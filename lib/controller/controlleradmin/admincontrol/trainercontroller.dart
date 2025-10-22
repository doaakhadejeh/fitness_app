import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/admincontrolremot.dart';
import 'package:get/get.dart';

class Admintrainercontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Admincontroldata admincontroldata = Admincontroldata(Get.find());

  bool secpass = true;
  List data = [];

  deletetrainer(id) async {
    stateerr = Stateerr.loding;
    update();
    var response = await admincontroldata.deletetrainer(
        services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getuser();
      update();
    }
  }

  getuser() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await admincontroldata.gettrainer(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      data = response["trainers"];
    }
  }

  @override
  void onInit() {
    getuser();
    super.onInit();
  }
}
