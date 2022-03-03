import 'package:get/get.dart';
import 'package:projetoapp/app/models/user_logged.dart';
import 'package:projetoapp/app/modules/home/home.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register_pet/register_pet_page.dart';

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
    // Controla o tempo do splash
    await 4.seconds.delay();
    if (sp.containsKey('user')) {
      /// Vai para home
      _logged(UserLogged.authententicate);
    } else {
      /// Vai para login
      _logged(UserLogged.unauthenticate);
    }
  }

  void checkIsLogged(UserLogged userLogged) async {
    final sp = await SharedPreferences.getInstance();
    switch (userLogged) {
      case UserLogged.authententicate:

        /// Se tiver a chave 'pet' já configurada, significa que o usuário
        /// já cadastrou o pet, caso contrário é necessário realizar o cadastro
        if (sp.containsKey('pet')) {
          Get.offAllNamed(HomePage.ROUTE_PAGE);
        } else {
          Get.offAllNamed(RegisterPetPage.ROUTE_PAGE);
        }

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
