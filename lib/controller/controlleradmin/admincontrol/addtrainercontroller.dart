import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/admincontrolremot.dart';
import 'package:fitnessapp/view/screen/admin/screenadmin/trainermanag.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Addtrainercontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Admincontroldata admincontroldata = Admincontroldata(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confpassword;
  late TextEditingController name;

  GlobalKey<FormState> f = GlobalKey<FormState>();
  bool secpass = true;

  showpass() {
    secpass = secpass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    confpassword = TextEditingController();

    name = TextEditingController();

    super.onInit();
  }

  addtrainer() async {
    var form = f.currentState;
    if (form!.validate()) {
      stateerr = Stateerr.loding;
      update();

      var response = await admincontroldata
          .addtrainer(services.shared.getString("token")!, {
        "email": email.text,
        "password": password.text,
        "password_confirmation": confpassword.text,
        "name": name.text
      });

      stateerr = handlingdata(response);
      update();

      if (stateerr == Stateerr.success) {
        Get.off(() => const Trainermanag());
      } else {
        Get.defaultDialog(
            title: "Error", content: const Text("Failed to add trainer."));
      }
    }
  }
}
