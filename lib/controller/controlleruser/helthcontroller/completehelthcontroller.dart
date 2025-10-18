import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/helthprofremote.dart';
import 'package:get/get.dart';

class Completehelthcontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  Services services = Get.find();
  Helthprofdata helthprofdata = Helthprofdata(Cud());

  bool? isComplete;
  List<String>? missingFields;

  @override
  void onInit() {
    checkCompletion();
    super.onInit();
  }

  Map<String, dynamic> updatedFields = {};

  void updateField(String field, String value) {
    updatedFields[field] = value;
  }

  Future<void> submitUpdatedFields() async {
    stateerr = Stateerr.loding;
    update();

    var token = services.shared.getString("token");
    var response = await helthprofdata.updatehelth(token!, updatedFields);

    stateerr = handlingdata(response);
    if (stateerr == Stateerr.success && response["status"] == 200) {
      Get.snackbar("Success", "Profile updated successfully");
      checkCompletion();
    } else {
      Get.snackbar("Error", "Something went wrong");
    }

    update();
  }

  checkCompletion() async {
    stateerr = Stateerr.loding;
    update();
    var token = services.shared.getString("token");
    // print(token);
    var response = await helthprofdata.completehelth(token!);
    stateerr = handlingdata(response);
    // print(response);
    if (stateerr == Stateerr.success && response["status"] == 200) {
      services.shared.setString("step", "4");
      isComplete = response["is_complete"];
      missingFields = List<String>.from(response["missing_fields"]);
    } else {
      stateerr = Stateerr.failure;
    }
    update();
  }
}
