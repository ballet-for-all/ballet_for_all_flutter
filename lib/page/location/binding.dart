import 'package:get/get.dart';

import 'controller.dart';

class LocationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LocationController());
  }
}