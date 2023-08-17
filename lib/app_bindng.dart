import 'package:get/get.dart';

import 'page/location/location_controller.dart';
import 'repository/city/location_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LocationRepository);
    Get.put(LocationController(), permanent: true);
  }
}
