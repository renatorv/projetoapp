import 'package:get/get.dart';
import 'package:projetoapp/app/models/user_logged.dart';
import 'package:projetoapp/app/modules/home/home.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final _logged = UserLogged.empty.obs;

  @override
  void onInit() {
    super.onInit();
    ever<UserLogged>(_logged, checkIsLogged);
    checkLogin();
  }

  UserLogged get logged => _logged.value;

  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    // await 2.seconds.delay();
    if (sp.containsKey('user')) {
      /// Vai para home
      _logged(UserLogged.authententicate);
    } else {
      /// Vai para login
      _logged(UserLogged.unauthenticate);
    }
  }

  void checkIsLogged(UserLogged userLogged) {
    switch (userLogged) {
      case UserLogged.authententicate:
        Get.offAllNamed(HomePage.ROUTE_PAGE);
        break;
      case UserLogged.unauthenticate:
        Get.offAllNamed(LoginPage.ROUTE_PAGE);
        break;
      case UserLogged.empty:
      default:
        break;
    }
  }
}
