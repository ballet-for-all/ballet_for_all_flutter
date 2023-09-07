import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/academy/academy.dart';
import '../../repository/academy/academy_repository.dart';

class AcademyController extends GetxController {
  final academyRepository = Get.put(AcademyRepository());

  final academy = Rxn<Academy>();
  final currentTab = 0.obs;
  final scrollController = ScrollController();
  final teacherKey = GlobalKey();
  final facilityKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments;
    fetchAcademy(id as String);

    scrollController.addListener(() {
      final teacherOffset = _keyToWidgetOffset(teacherKey);
      final facilityOffset = _keyToWidgetOffset(facilityKey);
      if (teacherOffset == null || facilityOffset == null) {
        return;
      }

      if (facilityOffset < 100) {
        currentTab.value = 1;
      } else if (teacherOffset < 100) {
        currentTab.value = 0;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> fetchAcademy(String id) async {
    academy.value = await academyRepository.getAcademy(id);
  }

  double? _keyToWidgetOffset(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero);
    return position?.dy;
  }
}
