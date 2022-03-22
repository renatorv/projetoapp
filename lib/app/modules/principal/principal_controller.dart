import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrincipalController extends GetxController {
  String? _img;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();

    _img = sp.getString('IMG_PET_LOCAL');

    update();
  }

  String? get imagem => _img;
}
