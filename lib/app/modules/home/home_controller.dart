import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/models/user_model.dart';
import 'package:projetoapp/app/modules/home_navigator/home_navigator_bindings.dart';
import 'package:projetoapp/app/modules/home_navigator/home_navigator_page.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../info_navigator/info_navigator_bindings.dart';
import '../info_navigator/info_navigator_page.dart';

import '../info_navigator_tutor/info_navigator_tutor_bindings.dart';
import '../info_navigator_tutor/info_navigator_tutor_page.dart';

class HomeController extends GetxController {
  final _name = ''.obs;

  static const NAVIGATOR_KEY = 1;

  final _tabIndex = 0.obs;
  final _tabs = [
    '/home-navigator',
    '/info-navigator',
    '/info-navigator-tutor',
    '/exit'
  ];

  @override
  void onInit() {
    super.onInit();
    pegaDadosLogin();
  }

  RxString get name => _name;
  int get tabIndex => _tabIndex.value;

  set tabIndex(int index) {
    _tabIndex(index);

    if (_tabs[index] == '/exit') {
      // chamar método de sair
      // 1 e 10 aula 3
      sair();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

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

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/home-navigator') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeNavigatorPage(),
        binding: HomeNavigatorBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/info-navigator') {
      return GetPageRoute(
        settings: settings,
        page: () => const InfoNavigatorPage(),
        binding: InfoNavigatorBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/info-navigator-tutor') {
      return GetPageRoute(
        settings: settings,
        page: () => const InfoNavigatorTutorPage(),
        binding: InfoNavigatorTutorBindings(),
        transition: Transition.fadeIn,
      );
    }
  }
}
