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
  final timetableKey = GlobalKey();
  final pricingKey = GlobalKey();
  final currentTimetableIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments;
    fetchAcademy(id as String);

    scrollController.addListener(() {
      final teacherOffset = _keyToWidgetOffset(teacherKey);
      final facilityOffset = _keyToWidgetOffset(facilityKey);
      final timetableOffset = _keyToWidgetOffset(timetableKey);
      final pricingOffset = _keyToWidgetOffset(pricingKey);
      if (teacherOffset == null ||
          facilityOffset == null ||
          timetableOffset == null ||
          pricingOffset == null) {
        return;
      }

      if (pricingOffset < 100) {
        currentTab.value = 3;
      } else if (timetableOffset < 100) {
        currentTab.value = 2;
      } else if (facilityOffset < 100) {
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
