import 'package:get/get.dart';

import '../../repository/academy/academy.dart';
import '../../repository/academy/academy_repository.dart';

class MainController extends GetxController {
  final academyRepository = Get.put(AcademyRepository());
  final AcademyList = <Academy>[].obs;

  RxString myLocation = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    AcademyList.value = await academyRepository.listAcademies();
    final myLocationArg = Get.arguments;
    myLocation.value = myLocationArg;
  }
}
