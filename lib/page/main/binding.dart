import 'package:get/get.dart';

import '../../repository/academy/academy_repository.dart';
import 'controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AcademyRepository());
    Get.put(MainController());
  }
}