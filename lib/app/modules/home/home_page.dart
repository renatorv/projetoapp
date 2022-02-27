import 'package:flutter/material.dart';
import 'package:projetoapp/app/core/insta_state.dart';
import './home_controller.dart';

class HomePage extends StatefulWidget {
  static const String ROUTE_PAGE = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends InstaState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(controller.name),
          ),
          Center(
            child: TextButton(
              onPressed: () => controller.sair(),
              child: Text('Sair'),
            ),
          ),
        ],
      ),
    );
  }
}
