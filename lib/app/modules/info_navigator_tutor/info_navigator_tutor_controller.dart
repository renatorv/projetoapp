import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class InfoNavigatorTutorController extends GetxController {
  final _name = ''.obs;
  final _email = ''.obs;

  final _nameEC = TextEditingController();

  final _emailEC = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    pegaDadosLogin();
  }

  Future<void> pegaDadosLogin() async {
    final sp = await SharedPreferences.getInstance();

    final usu = sp.getString('user');

    final _user = UserModel.fromJson(usu!);
    _name.value = _user.name;
    _email.value = _user.email;

    _nameEC.text = _user.name;

    _emailEC.text = _user.email;

    update();
  }

  String get name => _name.value;
  String get email => _email.value;

  TextEditingController get nameEC => _nameEC;

  TextEditingController get emailEC => _emailEC;
}
