import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/model/exerciesmodel.dart';
import 'package:fitnessapp/data/remot/exerciesremot.dart';
import 'package:get/get.dart';

class Excatcontroller extends GetxController {
  Stateerr stateerr = Stateerr.none;
  List<Exercisemodel> exercises = [];
  Services services = Get.find();
  int? id;
  String? image;
  String? name;

  final Exercisedata exerciseData = Exercisedata(Cud());

  @override
  void onInit() {
    id = Get.arguments["id"];
    image = Get.arguments["image"];
    name = Get.arguments["name"];

    fetchExercises();
    super.onInit();
  }

  fetchExercises() async {
    stateerr = Stateerr.loding;
    update();

    String token = services.shared.getString("token")!;

    var response = await exerciseData.filterExercises(
      token,
      filters: {
        "exercise_category_id": id.toString(),
        // "access_type": "public",
        // "is_active": true,
      },
    );

    if (response is List) {
      stateerr = Stateerr.success;
      exercises = response.map((e) => Exercisemodel.fromJson(e)).toList();
    } else {
      stateerr = handlingdata(response);
      if (stateerr == Stateerr.success) {
        exercises = (response["data"] as List)
            .map((e) => Exercisemodel.fromJson(e))
            .toList();
      }
    }
    update();
  }
}
