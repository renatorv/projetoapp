import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_models/photo_pet_view_model.dart';

class InfoNavigatorController extends GetxController {
  String? _img;

  final _nameEC = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();

    _img = sp.getString('pet');

    final objeto = sp.getString(Constants.OBJETO_PET);

    PhotoPetViewModel pet = PhotoPetViewModel.fromJson(objeto!);

    if (pet.nome != "") {
      _nameEC.text = pet.nome;
      update();
    } else {
      _nameEC.text = "a";
      update();
    }
  }

  String? get imagem => _img;
  TextEditingController get nameEC => _nameEC;
}
