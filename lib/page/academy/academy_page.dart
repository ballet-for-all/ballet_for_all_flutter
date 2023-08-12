import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widget/app_bar_action_button.dart';
import '../../../shared/widget/app_bar_leading_button.dart';
import 'academy_controller.dart';
import 'widget/academy_default_info.dart';
import 'widget/teacher_profile_list.dart';

class AcademyPage extends GetView<AcademyController> {
  static const routeName = '/academy';

  const AcademyPage({super.key});

  @override
  Widget build(BuildContext context) => Obx(() {
        final academy = controller.academy.value;
        if (academy == null) {
          return const SizedBox.shrink();
        }

        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: const AppBarLeadingButton(),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                actions: [
                  // TODO(ghrud92): 액션 버튼 색 변경
                  AppBarActionButton(
                    onPressed: () {},
                    icon: Icons.ios_share,
                  ),
                  const SizedBox(width: 4),
                  AppBarActionButton(
                    onPressed: () {},
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
              extendBodyBehindAppBar: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 266,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                    ),
                    itemCount: academy.images.length,
                    itemBuilder: (context, index, realIndex) => SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        academy.images[index],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // TODO(ghrud92): Carousel indicator 추가
                  AcademyDefaultInfo(
                    name: academy.name,
                    address: academy.address,
                    phone: academy.phone,
                    sns: academy.sns,
                  ),
                  const Divider(
                    height: 1,
                    color: Color(0xFFE5E5E5),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              // TODO(ghrud92): 스크롤 로직 추가
                              onPressed: () {},
                              child: Text(
                                '강사소개',
                                // TODO(ghrud92): 현재 보고 있는 위치 계산하는 로직 추가
                                style: _tabButtonStyle(true),
                              ),
                            ),
                            _tabIndicator(true),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '시설 사진',
                                style: _tabButtonStyle(false),
                              ),
                            ),
                            _tabIndicator(false),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '시간표',
                                style: _tabButtonStyle(false),
                              ),
                            ),
                            _tabIndicator(false),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '수강료',
                                style: _tabButtonStyle(false),
                              ),
                            ),
                            _tabIndicator(false),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 7,
                    thickness: 7,
                    color: Color(0xFFF4F4F4),
                  ),
                  TeacherProfileList(teachers: academy.teachers),
                ],
              ),
            ),
          ),
        );
      });

  TextStyle _tabButtonStyle(bool selected) => TextStyle(
        fontSize: 16,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w100,
        color: selected ? const Color(0xFF222222) : const Color(0xFF999999),
      );

  Widget _tabIndicator(bool selected) => Container(
        height: 4,
        color: selected ? Colors.black : Colors.transparent,
      );
}
