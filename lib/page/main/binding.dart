import 'package:get/get.dart';

import '../../repository/academy/academy_repository.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AcademyRepository());
  }
}