import 'dart:io';

import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Chatdata {
  Cud cud = Cud();

  Chatdata(this.cud);

  getchatrooms(String token) async {
    var response = await cud.getdatasecure(Applink.chatrooms, token);
    return response.fold((l) => l, (r) => r);
  }

  getuserchat(String token) async {
    var response = await cud.getdatasecure(Applink.viewuserchat, token);
    return response.fold((l) => l, (r) => r);
  }

  getmessage(String token, chatRoomId) async {
    var response =
        await cud.getdatasecure(Applink.chatmessages(chatRoomId), token);
    return response.fold((l) => l, (r) => r);
  }

  sendmessage(String token, chatRoomId, Map<String, String> data) async {
    var response =
        await cud.postdatasecure(Applink.chatsend(chatRoomId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  seenmessage(String token, messageId) async {
    var response =
        await cud.postdatasecure(Applink.chatseen(messageId), token, {});
    return response.fold((l) => l, (r) => r);
  }

  deletechat(String token, messageId) async {
    var response =
        await cud.deletedatasecure(Applink.chatdelete(messageId), token);
    return response.fold((l) => l, (r) => r);
  }

  chatcreateroom(Map<String, String> data, File? file, String token) async {
    var response = await cud.postdatawithfile(
        Applink.chatcreateroom, data, file, token, 'image');
    return response.fold((l) => l, (r) => r);
  }

  chataddusers(Map<String, String> data, String token, chatRoomId) async {
    var response =
        await cud.postdatasecure(Applink.chataddusers(chatRoomId), token, data);
    return response.fold((l) => l, (r) => r);
  }

  chatupdateroom(
      Map<String, String> data, File? file, String token, chatRoomId) async {
    var response = await cud.postdatawithfile(
        Applink.chatupdateroom(chatRoomId), data, file, token, 'image');
    return response.fold((l) => l, (r) => r);
  }

  showuserinchat(String token, chatRoomId) async {
    var response =
        await cud.getdatasecure(Applink.getuserinchat(chatRoomId), token);
    return response.fold((l) => l, (r) => r);
  }
}
