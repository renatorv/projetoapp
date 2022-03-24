import 'package:get/get.dart';
import 'package:projetoapp/app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_models/photo_pet_view_model.dart';

class InfoNavigatorController extends GetxController {
  String? _img;

  String _nome = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();

    _img = sp.getString(Constants.PHOTO_PET);

    final objeto = sp.getString(Constants.OBJETO_PET);

    PhotoPetViewModel pet = PhotoPetViewModel.fromJson(objeto!);

    _nome = pet.nome;

    update();
  }

  String? get imagem => _img;
  String get nome => _nome;
}


//prefs.setString(Constants.OBJETO_PET, _pet!.toJson());
//PhotoPetViewModel? _pet;