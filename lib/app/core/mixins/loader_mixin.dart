import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projetoapp/app/core/paleta_cores.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(
      loading,
      (_) async {
        if (loading.isTrue) {
          await Get.dialog(
            WillPopScope(
              onWillPop: () async => false,
              child: Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: PaletaCores.principal,
                  size: 70,
                ),
              ),
            ),
            barrierDismissible: false,
          );
        } else {
          Get.back();
        }
      },
    );
  }
}
