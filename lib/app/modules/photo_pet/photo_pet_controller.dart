import 'package:get/get.dart';

import '../../view_models/photo_pet_view_model.dart';

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
}
