import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/core/core.dart';
import '../../components/instapet_appbar.dart';
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
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          selectedIconTheme: IconThemeData(
            color: PaletaCores.principal,
            size: _responsive.dp(4.6),
          ),
          selectedItemColor: PaletaCores.principal,
          selectedFontSize: _responsive.dp(2.6),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Dados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/home-navigator',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('HomePage'),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Center(
    //         child: Obx(() => Text(controller.name.toString())),
    //       ),
    //       Center(
    //         child: TextButton(
    //           onPressed: () => controller.sair(),
    //           child: Text('Sair'),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
