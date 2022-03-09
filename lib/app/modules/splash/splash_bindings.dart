import 'package:get/get.dart';
import 'package:projetoapp/app/repositories/pet_repository.dart';
import './splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PetRepository(Get.find()));
    Get.put(SplashController(Get.find()));
  }
}
