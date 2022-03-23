import 'package:get/get.dart';
import './home_navigator_controller.dart';

class HomeNavigatorBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(HomeNavigatorController());
    }
}