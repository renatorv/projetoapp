import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_navigator_controller.dart';

class HomeNavigatorPage extends GetView<HomeNavigatorController> {
  const HomeNavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('HOME NAVIGATOR'),
    );
  }
}
