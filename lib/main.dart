import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/core/bindings/application_bindings.dart';
import 'package:projetoapp/app/core/ui_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: UiConfig.routes,
      theme: UiConfig.appTheme,
      initialBinding: ApplicationBindings(),
    );
  }
}
