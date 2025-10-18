import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/function/handlingdata.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/data/remot/chatremot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messageroomcontroller extends GetxController {
  late TextEditingController message;
  Stateerr? stateerr = Stateerr.none;
  Chatdata remot = Chatdata(Get.find());
  Services services = Get.find();
  List messages = [];
  List sender = [];
  List member = [];
  int isgroup = 0;
  List user = [];
  List<String> selectedUsers = [];
  String? chatRoomId;
  String? nameroom;
  String? image;
  String? isimg;

  @override
  void onInit() {
    message = TextEditingController();
    chatRoomId = Get.arguments["chatRoomId"];
    nameroom = Get.arguments["nameroom"];
    image = Get.arguments["image"];
    isgroup = Get.arguments["isgroup"];
    isimg = Get.arguments["isimg"];

    getuser();
    getmessage();
    showmember(chatRoomId);
    super.onInit();
  }

  getuser() async {
    stateerr = Stateerr.loding;

    update();
    var response = await remot.getuserchat(services.shared.getString("token")!);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      response['users'] == null ? [] : user = response['users'];
    } else {
      Get.defaultDialog(title: "you can't add chat", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  getmessage() async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await remot.getmessage(services.shared.getString("token")!, chatRoomId);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      messages = response['messages'];
      // sender = response['sender'];
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  sendmessage() async {
    stateerr = Stateerr.loding;
    Map<String, String> mym = {"message": message.text, "message_type": "text"};
    update();
    var response = await remot.sendmessage(
        services.shared.getString("token")!, chatRoomId, mym);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      message.clear();
      getmessage();
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  seenmessage(messageid) async {
    stateerr = Stateerr.loding;

    update();
    var response =
        await remot.seenmessage(services.shared.getString("token")!, messageid);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      getmessage();
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  addusertochat() async {
    stateerr = Stateerr.loding;
    update();

    Map<String, String> data = {};

    for (int i = 0; i < selectedUsers.length; i++) {
      data["user_ids[$i]"] = selectedUsers[i];
    }

    var response = await remot.chataddusers(
      data,
      services.shared.getString("token")!,
      chatRoomId,
    );

    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      Get.defaultDialog(
        title: "add user success",
        content: const Icon(Icons.done, color: Colors.green),
      );
      getmessage();
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  deletechat(messageid) async {
    stateerr = Stateerr.loding;
    update();
    var response =
        await remot.deletechat(services.shared.getString("token")!, messageid);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      Get.defaultDialog(title: "Message delete!", content: const Text(""));
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }

  showmember(chatRoomId) async {
    stateerr = Stateerr.loding;
    update();
    var response = await remot.showuserinchat(
        services.shared.getString("token")!, chatRoomId);
    stateerr = handlingdata(response);
    if (Stateerr.success == stateerr) {
      response["usersInRoom"] == null
          ? member = []
          : member = response["usersInRoom"];
    } else {
      Get.defaultDialog(title: "error", content: const Text(""));
      stateerr = Stateerr.failure;
    }
    update();
  }
}
