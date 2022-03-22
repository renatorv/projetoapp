import 'package:get/get.dart';
import 'package:projetoapp/app/modules/home/home.dart';

import '../../view_models/photo_pet_view_model.dart';

import 'dart:io';

class PhotoPetController extends GetxController {
  dynamic args = Get.arguments;

  PhotoPetViewModel? _pet;

  @override
  void onInit() {
    super.onInit();

    _pet = Get.arguments;
  }

  String? get nome => _pet?.nome;
  String? get especie => _pet?.especie;
  String? get raca => _pet?.raca;

  Future<void> cadastraPet(File? image) async {
    if (image != null) {
      Get.offAllNamed(HomePage.ROUTE_PAGE);
    }
  }
}
