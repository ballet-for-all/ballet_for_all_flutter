import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widget/safe_bottom_button.dart';
import 'location_controller.dart';
import './widget/location_list_item.dart';

const _borderSide = BorderSide(color: Color(0xFFCCCCCC), width: 1);

class LocationPage extends GetView<LocationController> {
  static const routeName = '/location';

  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '내 동네 설정하기',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 22),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          controller.searchText(text);
                        },
                        style: const TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          hintText: '동이름(읍,면)으로 검색',
                          hintStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF999999),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F5F5),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // TODO(ghrud92): 위치 권한 요청 & 현재 위치로 동네 변경
                      },
                      icon: Image.asset(
                        'assets/icons/location.png',
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(top: _borderSide, right: _borderSide),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, i) {
                            final city = controller.cities[i];
                            return LocationListItem(
                              text: city.name,
                              selected: controller.selectedCity.value == i,
                              onTap: () {
                                controller.selectCity(i);
                              },
                            );
                          },
                          itemCount: controller.cities.length,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(top: _borderSide),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, i) {
                            final district = controller.districts[i];
                            return LocationListItem(
                              text: district.name,
                              selected: controller.selectedDistrict.value == i,
                              onTap: () {
                                controller.selectDistrict(i);
                              },
                            );
                          },
                          itemCount: controller.districts.length,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(top: _borderSide, left: _borderSide),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, i) {
                            final block = controller.blocks[i];
                            return Obx(() => LocationListItem(
                                  text: block.name,
                                  selected: controller.selectedBlock.value == i,
                                  onTap: () {
                                    controller.selectBlock(i);
                                  },
                                ));
                          },
                          itemCount: controller.blocks.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.selectedBlock.value != -1
                  ? SafeBottomButton(
                      onTap: () {
                        controller.onSettingClick();
                      },
                      child: const Text(
                        '설정하기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
}
