import 'package:get/get.dart';
import './photo_pet_controller.dart';

class PhotoPetBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PhotoPetController());
    }
}