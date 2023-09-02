import 'package:get/get.dart';

import '../../repository/academy/academy.dart';
import '../../repository/academy/academy_repository.dart';

class AcademyController extends GetxController {
  final academyRepository = Get.put(AcademyRepository());

  final academy = Rxn<Academy>();

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments;
    fetchAcademy(id as String);
  }

  Future<void> fetchAcademy(String id) async {
    academy.value = await academyRepository.getAcademy(id);
  }
}
