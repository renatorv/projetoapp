import 'package:get/get.dart';
import 'package:projetoapp/app/repositories/pet_repository.dart';
import './register_pet_controller.dart';

class RegisterPetBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PetRepository(Get.find()));
    Get.put(RegisterPetController(Get.find()));
  }
}
