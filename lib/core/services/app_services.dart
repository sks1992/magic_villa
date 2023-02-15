import 'dart:convert';

import 'package:get/get.dart';
import 'package:magic_villa/core/models/villaModel.dart';

class AppService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://10.0.2.2:1211/api";
    httpClient.timeout = const Duration(minutes: 5);
    httpClient.addAuthenticator<void>((request) async {
      request.headers['Content-type'] = "application/json";
      return request;
    });
    super.onInit();
  }

  Future<List<VillaModel>> getVillasData() async {
    final response = await get("/VillaAPI");

    if (response.hasError) {
      return [];
    } else {
      List<dynamic> villaListJson = jsonDecode(response.bodyString!);
      final villaList =
          villaListJson.map((e) => VillaModel.fromJson(e)).toList();
      return villaList;
    }
  }

  Future<VillaModel> getVillaById(int id) async {
    final response = await get("/VillaAPI/$id");
    if (response.hasError) {
      return VillaModel(isSuccess: false, message: "Something Went Wrong");
    } else {
      var result = VillaModel.fromJson(json.decode(response.bodyString!));
      result.isSuccess = true;
      result.message = "";
      return result;
    }
  }
}
