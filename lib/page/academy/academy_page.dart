import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widget/app_bar_action_button.dart';
import '../../../shared/widget/app_bar_leading_button.dart';
import '../../shared/widget/persistent_header_delegate.dart';
import 'academy_controller.dart';
import 'widget/academy_default_info.dart';
import 'widget/academy_tab_bar.dart';
import 'widget/teacher_profile_list.dart';

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
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: _carouselImageHeight,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                            ),
                            itemCount: academy.images.length,
                            itemBuilder: (context, index, realIndex) =>
                                SizedBox(
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
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentHeaderDelegate(
                      minHeight: AcademyTabBar.height,
                      maxHeight: AcademyTabBar.height,
                      child: const AcademyTabBar(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TeacherProfileList(teachers: academy.teachers),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
