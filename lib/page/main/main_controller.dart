import 'package:get/get.dart';

import '../../repository/academy/academy.dart';
import '../../repository/academy/academy_repository.dart';
import '../academy/academy_page.dart';

class MainController extends GetxController {
  final academyRepository = Get.put(AcademyRepository());
  final academyList = <Academy>[].obs;

  RxString myLocation = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    academyList.value = await academyRepository.listAcademies();
    final myLocationArg = Get.arguments['location'].toString();
    myLocation.value = myLocationArg;
  }

  Future<void> onAcademyClick(int i) async {
    Get.toNamed(AcademyPage.routeName, arguments: academyList[i].id);
  }
}
