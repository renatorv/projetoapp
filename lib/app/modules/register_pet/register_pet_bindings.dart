import 'package:get/get.dart';
import './register_pet_controller.dart';

class RegisterPetBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(RegisterPetController());
    }
}