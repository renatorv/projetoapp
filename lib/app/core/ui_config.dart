import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetoapp/app/modules/home/home.dart';
import 'package:projetoapp/app/modules/login/login.dart';
import 'package:projetoapp/app/modules/register/register.dart';
import 'package:projetoapp/app/modules/splash/splash.dart';

class UiConfig {
  UiConfig._();
  static final appTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: Color(0xFFF5591F),
    primarySwatch: Colors.orange,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFF5591F),
        // textStyle: const TextStyle(fontFamily: ''),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);

  static final routes = <GetPage>[
    GetPage(
      name: SplashPage.ROUTE_PAGE,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: LoginPage.ROUTE_PAGE,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: HomePage.ROUTE_PAGE,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RegisterPage.ROUTE_PAGE,
      page: () => RegisterPage(),
      binding: RegisterBindings(),
    )
  ];
}
