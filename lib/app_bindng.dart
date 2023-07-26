import 'package:get/get.dart';

import 'page/location1/controller.dart';
import 'repository1/location_repository.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LocationRepository);
    Get.put(LocationController(),permanent: true);
  }

}