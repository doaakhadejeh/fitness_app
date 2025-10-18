// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/admincontrolremot.dart';
import 'package:get/get.dart';

class Adminusercontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Admincontroldata admincontroldata = Admincontroldata(Get.find());

  bool secpass = true;
  List data = [];

  getuser() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await admincontroldata.getuser(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      response["users"] == null ? [] : data = response["users"];
    }
  }

  @override
  void onInit() {
    getuser();
    super.onInit();
  }

  deleteuser(id) async {
    stateerr = Stateerr.loding;
    update();
    var response = await admincontroldata.deleteuser(
        services.shared.getString("token")!, id);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      Get.offNamed(Approut.adminHome);
    }
  }

  toggleBlockUser(int index) async {
    String userId = data[index]["id"].toString();
    bool isBlocked = data[index]["is_blocked"] == true;

    stateerr = Stateerr.loding;
    update();

    var response;
    if (!isBlocked) {
      response = await admincontroldata.blockuser(
          services.shared.getString("token")!, userId);
    } else {
      response = await admincontroldata.unblockuser(
          services.shared.getString("token")!, userId);
    }

    stateerr = handlingdata(response);
    update();

    if (stateerr == Stateerr.success) {
      // نقلب القيمة
      data[index]["is_blocked"] = !isBlocked;
      update();
    }
  }
}
