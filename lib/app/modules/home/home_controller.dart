import 'package:get/get.dart';
import 'package:projetoapp/app/models/user_model.dart';
import 'package:projetoapp/app/modules/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String _name = '';
  @override
  void onInit() {
    super.onInit();
    pegaDadosLogin();
  }

  String get name => _name;

  Future<void> pegaDadosLogin() async {
    final sp = await SharedPreferences.getInstance();

    final usu = sp.getString('user');

    final _user = UserModel.fromJson(usu!);
    _name = _user.name;

    update();
  }

  void sair() async {
    final sp = await SharedPreferences.getInstance();

    sp.clear();

    Get.offAllNamed(SplashPage.ROUTE_PAGE);
  }
}
