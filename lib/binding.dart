import 'package:fitnessapp/core/class/cud.dart';
import 'package:get/get.dart';

class Initialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Cud());
  }
}
