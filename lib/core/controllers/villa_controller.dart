import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:magic_villa/core/models/villaModel.dart';
import 'package:magic_villa/core/services/app_services.dart';
import 'package:magic_villa/core/util_or_constants/helpers.dart';

class VillaController extends GetxController {
  var showLinearProgress = false.obs;
  var showLinearProgress1 = false.obs;
  var showData = false.obs;
  final _appApi = Get.put(AppService());
  Rx<List<VillaModel>> villasList = Rx<List<VillaModel>>([]);

  var villa = VillaModel();
  late TextEditingController id;

  @override
  void onInit() async {
    id = TextEditingController();
    await getVillaData();

    super.onInit();
  }

  @override
  void onClose() {
    id.dispose();
    super.onClose();
  }

  Future<void> getVillaData() async {
    showLinearProgress.value = true;
    var result = await _appApi.getVillasData();
    if (result.isEmpty) {
      showLinearProgress.value = false;
      showSnackBar1("Error", "Something Went wrong try Again");
    } else {
      showLinearProgress.value = false;
      villasList.value = result;
    }
  }

  Future<void> getVillaById(int id) async {
    showLinearProgress1.value = true;
    showData.value = true;
    var result = await _appApi.getVillaById(id);
    if (!result.isSuccess) {
      showLinearProgress1.value = false;
      showData.value = false;
      showSnackBar1("Error", "Something Went wrong try Again");
    } else {
      showLinearProgress1.value = false;
      villa = result;
    }
  }
}
