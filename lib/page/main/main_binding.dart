import 'package:get/get.dart';

import '../../repository/academy/academy_repository.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AcademyRepository());
    Get.put(MainController());
  }
}
