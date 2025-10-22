import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:get/get.dart';

class Profilecontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  String? name;
  String? email;
  String? phone;

  @override
  void onInit() {
    name = services.shared.getString("name");
    email = services.shared.getString("email");
    phone = services.shared.getString("phone");
    super.onInit();
  }
}
