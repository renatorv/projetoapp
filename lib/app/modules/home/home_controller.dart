import 'package:get/get.dart';
import 'package:projetoapp/app/models/user_model.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final _name = ''.obs;
  @override
  void onInit() {
    super.onInit();
    pegaDadosLogin();
  }

  RxString get name => _name;

  Future<void> pegaDadosLogin() async {
    final sp = await SharedPreferences.getInstance();

    final usu = sp.getString('user');

    final _user = UserModel.fromJson(usu!);
    _name.value = _user.name;

    update();
  }

  void sair() async {
    final sp = await SharedPreferences.getInstance();

    sp.clear();

    Get.offAllNamed(LoginPage.ROUTE_PAGE);
  }
}
