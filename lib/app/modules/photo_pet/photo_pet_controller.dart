import 'package:get/get.dart';
import 'package:projetoapp/app/core/mixins/mixins.dart';
import 'package:projetoapp/app/modules/home/home.dart';

import '../../view_models/photo_pet_view_model.dart';

import 'dart:io';

class PhotoPetController extends GetxController with MessageMixin {
  dynamic args = Get.arguments;

  PhotoPetViewModel? _pet;

  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();

    _pet = Get.arguments;

    messageListener(_message);
  }

  String? get nome => _pet?.nome;
  String? get especie => _pet?.especie;
  String? get raca => _pet?.raca;

  Future<void> cadastraPet(File? image) async {
    if (image != null) {
      Get.offAllNamed(HomePage.ROUTE_PAGE);
    } else {
      _message(
        MessageModel(
          title: 'Atenção',
          message: 'Favor informar uma foto de seu amiguinho.',
          type: MessageType.info,
        ),
      );
    }
  }
}
