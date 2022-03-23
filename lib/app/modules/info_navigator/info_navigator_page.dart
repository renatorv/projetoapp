import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './info_navigator_controller.dart';

class InfoNavigatorPage extends GetView<InfoNavigatorController> {
  const InfoNavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('INFO NAVIGATOR'),
    );
  }
}
