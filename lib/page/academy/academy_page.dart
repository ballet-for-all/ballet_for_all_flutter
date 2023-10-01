import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widget/app_bar_action_button.dart';
import '../../../shared/widget/app_bar_leading_button.dart';
import '../../shared/widget/image_carousel.dart';
import '../../shared/widget/persistent_header_delegate.dart';
import 'academy_controller.dart';
import 'widget/academy_default_info.dart';
import 'widget/academy_tab_bar.dart';
import 'widget/facility_photo_grid.dart';
import 'widget/pricing_description_section.dart';
import 'widget/pricing_section.dart';
import 'widget/teacher_profile_list.dart';
import 'widget/timetable_section.dart';

const double _carouselImageHeight = 266;

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
              body: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
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
                    expandedHeight:
                        _carouselImageHeight + AcademyDefaultInfo.height,
                    floating: false,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(
                        children: [
                          ImageCarousel(
                            height: _carouselImageHeight,
                            images: academy.images,
                          ),
                          // TODO(ghrud92): Carousel indicator 추가
                          AcademyDefaultInfo(
                            name: academy.name,
                            address: academy.address,
                            phone: academy.phone,
                            sns: academy.sns,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentHeaderDelegate(
                      minHeight: AcademyTabBar.height,
                      maxHeight: AcademyTabBar.height,
                      child: AcademyTabBar(
                        currentTab: controller.currentTab.value,
                        onTeacherTabPressed: () {
                          Scrollable.ensureVisible(
                            controller.teacherKey.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        onFacilityTabPressed: () {
                          Scrollable.ensureVisible(
                            controller.facilityKey.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        onTimetableTabPressed: () {
                          Scrollable.ensureVisible(
                            controller.timetableKey.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        onCourceFeeTabPressed: () => debugPrint('수강료'),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TeacherProfileList(
                      key: controller.teacherKey,
                      teachers: academy.teachers,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FacilityPhotoGrid(
                      key: controller.facilityKey,
                      photos: academy.images,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TimetableSection(
                      key: controller.timetableKey,
                      timetables: academy.timetables ?? const [],
                      selectedIndex: controller.currentTimetableIndex.value,
                      onTimetableSelected: (index) {
                        controller.currentTimetableIndex.value = index;
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PricingSection(pricing: academy.pricing ?? []),
                  ),
                  SliverToBoxAdapter(
                    child: PricingDescriptionSection(
                      description: academy.pricingDescription,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 28),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(
                              side: BorderSide(color: Color(0xFF999999)),
                            ),
                            backgroundColor: Colors.white,
                            fixedSize: const Size(50, 50),
                            elevation: 0,
                          ),
                          child: const Icon(
                            Icons.arrow_upward,
                            size: 25,
                            color: Color(0xFF999999),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '맨 위로',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
