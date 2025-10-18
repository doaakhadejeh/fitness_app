import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/healthprofilemodel.dart';
import 'package:fitnessapp/data/remot/helthprofremote.dart';
import 'package:get/get.dart';

class HealthProfileAdminController extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Helthprofdata remote = Helthprofdata(Get.find());

  HealthProfileModel? profile;

  getUserHealthProfile(int userId) async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.showhelthadmin(
        services.shared.getString("token")!, userId);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      response['data'] == null
          ? profile = null
          : profile = HealthProfileModel.fromJson(response['data']);
    }

    update();
  }

  deleteUserHealthProfile(int userId) async {
    stateerr = Stateerr.loding;
    update();

    var response = await remote.deletehelthadmin(
        services.shared.getString("token")!, userId);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success) {
      getUserHealthProfile(userId);
      update();
    }

    update();
  }
}
