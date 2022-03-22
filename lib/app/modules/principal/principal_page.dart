import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/core/core.dart';
import './principal_controller.dart';

class PrincipalPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/principal';

  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState
    extends InstaState<PrincipalPage, PrincipalController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrincipalController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Principal Page'),
        ),
        body: controller.imagem != null
            ? CircleAvatar(
                backgroundImage: FileImage(File(controller.imagem!)),
                radius: 50,
                backgroundColor: Colors.white,
              )
            : CircularProgressIndicator(
                color: PaletaCores.principal,
              ),
      ),
    );
  }
}
