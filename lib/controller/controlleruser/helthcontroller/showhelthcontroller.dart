import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/healthprofilemodel.dart';
import 'package:fitnessapp/data/remot/helthprofremote.dart';
import 'package:get/get.dart';

class Showhelthcontroller extends GetxController {
  Helthprofdata helthprofdata = Helthprofdata(Cud());
  Stateerr stateerr = Stateerr.none;
  HealthProfileModel? profileData;
  Services services = Get.find();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    stateerr = Stateerr.loding;
    update();
    var token = services.shared.getString("token");
    var response = await helthprofdata.showhelth(token!);
    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success
        // &&
        // response['status'] == 200 &&
        // response['status'] == 201
        ) {
      // if (response['data'] == null) {
      //   profileData = ;
      // }
      profileData = HealthProfileModel.fromJson(response['data']);
    } else {
      // print(response);

      stateerr = Stateerr.failure;
    }
    update();
  }
}
