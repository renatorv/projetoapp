import 'package:get/get.dart';
import './principal_controller.dart';

class PrincipalBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PrincipalController());
    }
}