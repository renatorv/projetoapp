import 'dart:developer';

import 'package:get/get.dart';
import 'package:projetoapp/app/modules/splash/splash_page.dart';
import 'package:projetoapp/app/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final UserRepository _repository;
  LoginController(this._repository);

  void login(String email, String password) async {
    try {
      final _user = await _repository.login(email, password);

      final sp = await SharedPreferences.getInstance();
      await sp.setString('user', _user.toJson());
      Get.offAllNamed(SplashPage.ROUTE_PAGE);
    } catch (e) {
      log(e.toString());
    }
  }

  /// Tratamento obscure - aula 3 => 44 minutos
  // final _obscureText = true.obs;
  // get obscureText => _obscureText.value;
  // void showHidePassword() => _obscureText.toggle();
}
