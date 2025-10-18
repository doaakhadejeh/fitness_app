import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/trainercontrolremot.dart';
import 'package:get/get.dart';

class Trainerusercontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Trainercontroldata trainercontroldata = Trainercontroldata(Get.find());

  bool secpass = true;
  List data = [];

  getuser() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await trainercontroldata.getuser(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      response["users"] == null ? [] : data = response["users"];
    }
    update();
  }

  @override
  void onInit() {
    getuser();
    super.onInit();
  }

  toggleSupervisionForUser(Map user) async {
    stateerr = Stateerr.loding;
    update();

    String userId = user["id"].toString();
    bool isSupervised = user["trainer_id"] != null;

    var token = services.shared.getString("token")!;

    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (isSupervised) {
      response = await trainercontroldata.deleteuser(token, userId);
    } else {
      response = await trainercontroldata.adduser(token, userId);
    }

    stateerr = handlingdata(response);
    update();
    if (stateerr == Stateerr.success) {
      getuser(); // تحديث البيانات بعد التعديل
    }
  }
}
