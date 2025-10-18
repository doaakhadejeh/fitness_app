// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:io';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/chatremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Chatroomcontroller extends GetxController {
  Stateerr? stateerr = Stateerr.none;
  Chatdata remot = Chatdata(Get.find());
  Services services = Get.find();
  List chat = [];
  List user = [];
  bool isGroup = false;
  List<String> selectedUsers = [];

  File? imageFile;
  late TextEditingController name;
  late TextEditingController nameup;

  @override
  void onInit() {
    name = TextEditingController();
    nameup = TextEditingController();
    getuser();
    getchat();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    nameup.dispose();
    super.dispose();
  }

  chooseImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile = File(picked.path);
      update();
    }
  }

  getchat() async {
    stateerr = Stateerr.loding;

    update();
    var response =
        await remot.getchatrooms(services.shared.getString("token")!);
    print("🛑 Response body: ${response}");

    stateerr = handlingdata(response);

    print("🛑 Response body: ${response}");
    if (Stateerr.success == stateerr) {
      chat = response['chatRooms'];
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  getuser() async {
    stateerr = Stateerr.loding;

    update();
    var response = await remot.getuserchat(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      if (response['users'] == null) {
        user = [];
      } else {
        user = response['users'];
      }
    } else {
      Get.defaultDialog(title: "you can't add chat", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  addchat() async {
    stateerr = Stateerr.loding;
    update();

    Map<String, String> data = {
      "name": name.text,
      "is_group": isGroup ? "1" : "0",
    };

    // ✅ ضيفي المستخدمين المختارين كـ array style
    for (int i = 0; i < selectedUsers.length; i++) {
      data["user_ids[$i]"] = selectedUsers[i];
    }

    var response = await remot.chatcreateroom(
      data,
      imageFile,
      services.shared.getString("token")!,
    );

    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      Get.back();
      Get.defaultDialog(
        title: "",
        content: const Icon(Icons.done, color: Colors.green),
      );
      getchat();
    } else {
      Get.defaultDialog(
          title: "  can't add this chat", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  updatechat(chatRoomId) async {
    stateerr = Stateerr.loding;
    Map<String, String> data = {"name": nameup.text};

    update();
    var response = await remot.chatupdateroom(
        data,
        (imageFile != null && imageFile!.existsSync()) ? imageFile : null,
        services.shared.getString("token")!,
        chatRoomId);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      Get.back();
      Get.defaultDialog(
          title: "",
          content: const Icon(
            Icons.done,
            color: Colors.green,
          ));
      getchat();
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }
}
