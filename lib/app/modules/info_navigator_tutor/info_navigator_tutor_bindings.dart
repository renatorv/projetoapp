import 'package:get/get.dart';
import './info_navigator_tutor_controller.dart';

class InfoNavigatorTutorBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(InfoNavigatorTutorController());
    }
}