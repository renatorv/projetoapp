import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './register_pet_controller.dart';

class RegisterPetPage extends GetView<RegisterPetController> {
  static const String ROUTE_PAGE = '/register-pet';
  const RegisterPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPetPage'),
      ),
      body: Container(),
    );
  }
}
