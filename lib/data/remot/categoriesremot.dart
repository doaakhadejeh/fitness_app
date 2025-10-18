import 'dart:io';

import 'package:fitnessapp/core/class/cud.dart';
import 'package:fitnessapp/link.dart';

class Categoriesdata {
  Cud cud = Cud();

  Categoriesdata(this.cud);

  // Get categories
  getCategories(String token) async {
    var response = await cud.getdatasecure(Applink.categories, token);
    return response.fold((l) => l, (r) => r);
  }

  searh(String token, String search) async {
    var response =
        await cud.postdatasecure(Applink.search, token, {"search": search});
    return response.fold((l) => l, (r) => r);
  }

  // Add category
  addCategory(Map<String, dynamic> data, File? file, String token) async {
    var response = await cud.postdatawithfile(
        Applink.addCategory, data, file, token, 'image');
    return response.fold((l) => l, (r) => r);
  }

  // Edit category
  editCategory(
      Map<String, String> data, File? file, String token, String id) async {
    var response = await cud.putdatawithfile(
        "${Applink.editCategory}/$id", data, file, token, 'image');
    return response.fold((l) => l, (r) => r);
  }

  // delete category
  deletecategory(String token, id) async {
    var response =
        await cud.deletedatasecure(Applink.deleteCategory(id), token);
    return response.fold((l) => l, (r) => r);
  }
}
