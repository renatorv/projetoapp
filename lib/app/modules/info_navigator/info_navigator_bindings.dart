import 'package:get/get.dart';
import './info_navigator_controller.dart';

class InfoNavigatorBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(InfoNavigatorController());
    }
}