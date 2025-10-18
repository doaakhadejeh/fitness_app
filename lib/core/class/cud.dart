// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Cud {
  Future<Either<Stateerr, Map>> postdatawithfile(
      String linkurl, Map data, File? image, token,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(linkurl);
    var request = http.MultipartRequest("post", uri);
    request.headers.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartfile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartfile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      if (kDebugMode) {
        print("🛑 Response status: ${response.statusCode}");
        print("🛑 Response body: ${response.body}");
      }
      return left(Stateerr.serverfailuer);
    }
  }

  Future<Either<Stateerr, Map>> patchdatawithfile(
      String linkurl, Map data, File? image, token,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(linkurl);
    var request = http.MultipartRequest("patch", uri);
    request.headers.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartfile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartfile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      if (kDebugMode) {
        print("🛑 Response status: ${response.statusCode}");
        print("🛑 Response body: ${response.body}");
      }
      return left(Stateerr.serverfailuer);
    }
  }

  Future<Either<Stateerr, Map>> putdatawithfile(
      String linkurl, Map data, File? image, token,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(linkurl);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });

    data['_method'] = 'put';

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartfile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartfile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      if (kDebugMode) {
        print("🛑 Response status: ${response.statusCode}");
        print("🛑 Response body: ${response.body}");
      }
      return left(Stateerr.serverfailuer);
    }
  }

  Future<Either<Stateerr, Map>> postdatasecure(
      String linkurl, String token, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl),
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
          body: data);

      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return Right(responsebody);
    } catch (e) {
      print("====================$e====");

      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> postdata(String linkurl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl), body: data);

      Map responsebody = jsonDecode(response.body);
      print(responsebody);

      return Right(responsebody);
    } catch (e) {
      print("====================$e====");

      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> getdata(String linkurl) async {
    try {
      var response = await http.get(Uri.parse(linkurl));

      Map responsebody = jsonDecode(response.body);
      //print(responsebody);
      print("🛑 Response status: ${response.statusCode}");
      print("🛑 Response body: ${response.body}");
      return Right(responsebody);
    } catch (e) {
      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> getdatasecure(
      String linkurl, String token) async {
    try {
      var response = await http.get(Uri.parse(linkurl), headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });

      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      print("🛑 Response status: ${response.statusCode}");
      print("🛑 Response body: ${response.body}");
      return Right(responsebody);
    } catch (e) {
      print("=======================$e");

      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> putdatasecure(
      String linkurl, String token, Map data) async {
    try {
      var response = await http.put(Uri.parse(linkurl),
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
          body: data);
      Map responsebody = jsonDecode(response.body);
      //print(responsebody);
      return Right(responsebody);
    } catch (e) {
      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> putDataSecureJson(
      String linkurl, String token, Map<String, dynamic> data) async {
    try {
      var response = await http.put(Uri.parse(linkurl),
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
            "Content-Type": "application/json", // هذا هو المفتاح!
          },
          body: jsonEncode(data)); // هنا يتم ترميز الـ Map إلى JSON
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } catch (e) {
      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> putdata(String linkurl, Map data) async {
    try {
      var response = await http.put(Uri.parse(linkurl), body: data);
      Map responsebody = jsonDecode(response.body);
      //print(responsebody);
      return Right(responsebody);
    } catch (e) {
      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> deletedata(String linkurl) async {
    try {
      var response = await http.delete(Uri.parse(linkurl));
      Map responsebody = jsonDecode(response.body);
      //print(responsebody);
      return Right(responsebody);
    } catch (e) {
      return left(Stateerr.serverexeption);
    }
  }

  Future<Either<Stateerr, Map>> deletedatasecure(
      String linkurl, String token) async {
    try {
      var response = await http.delete(
        Uri.parse(linkurl),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );
      Map responsebody = jsonDecode(response.body);
      //print(responsebody);
      return Right(responsebody);
    } catch (e) {
      return left(Stateerr.serverexeption);
    }
  }
}
