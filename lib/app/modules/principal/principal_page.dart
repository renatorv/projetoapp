import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './principal_controller.dart';

class PrincipalPage extends GetView<PrincipalController> {
  static const String ROUTE_PAGE = '/principal';

  const PrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Principal Page'),
      ),
      body: Container(),
    );
  }
}
