import 'package:flutter_state_management/getx/mvc_design_pattern/controller/home_controller.dart';
import 'package:get/get.dart';

// Call the Box then inject all the available dependencies
// Without need to inject inside the view
class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
