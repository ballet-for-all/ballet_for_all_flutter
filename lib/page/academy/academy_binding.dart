import 'package:get/get.dart';

import 'academy_controller.dart';

class AcademyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AcademyController());
  }
}
