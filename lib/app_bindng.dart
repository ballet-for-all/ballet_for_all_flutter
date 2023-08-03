import 'package:get/get.dart';

import 'page/location/controller.dart';
import 'page/main/controller.dart';
import 'repository/city/location_repository.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LocationRepository);
    Get.put(LocationController(),permanent: true);
  }

}