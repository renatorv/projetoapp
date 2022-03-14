import 'package:get/get.dart';

class PhotoPetController extends GetxController {
  dynamic args = Get.arguments;

  String? _nome, _especie, _raca;

  @override
  void onInit() {
    super.onInit();
    _nome = args[0];
    _especie = args[1];
    _raca = args[2];

    print(_nome);
    print(_especie);
    print(_raca);
  }
}


//_nameEC.text, especieId, racaId