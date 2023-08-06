import 'package:get/get.dart';

import '../../repository/academy/academy.dart';
import '../../repository/academy/academy_repository.dart';

class MainController extends GetxController {
  final mainRepository = Get.put(AcademyRepository());
  RxList<Academy> list = <Academy>[].obs;

  RxString myLocation = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    list.value = await mainRepository.listAcademies();
    myLocation.value = '강남구';
  }
}
