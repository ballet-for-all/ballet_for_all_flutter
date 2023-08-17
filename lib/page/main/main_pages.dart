import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../shared/widget/app_bar_action_button.dart';
import 'main_controller.dart';
import 'widget/academy_list_title.dart';

class MainView extends GetView<MainController> {
  static const routeName = '/main';

  const MainView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: SvgPicture.asset('assets/icons/wings.svg'),
          ),
          leadingWidth: 56,
          actions: [
            AppBarActionButton(
              onPressed: () {},
              label: controller.myLocation.value,
              icon: Icons.keyboard_arrow_down,
            ),
            const SizedBox(width: 5),
            AppBarActionButton(
              onPressed: () {},
              icon: Icons.filter_list,
            ),
            const SizedBox(width: 5),
            AppBarActionButton(
              onPressed: () {},
              icon: Icons.favorite_border,
            ),
            const SizedBox(width: 24),
          ],
        ),
        body: Container(
          color: const Color(0xFFF5F5F5),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5282FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '오늘 처음 오셨나요?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFE0ECFB),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '모두의 발레 서비스 안내',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFBFFF9),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => AcademyListTile(
                    id: controller.AcademyList[index].id,
                    academyImages: controller.AcademyList[index].images,
                    academyName: controller.AcademyList[index].name,
                    academyAddress: controller.AcademyList[index].address,
                    regularPrice: controller.AcademyList[index].minRegularPrice,
                    couponPrice: controller.AcademyList[index].minCouponPrice,
                    pieceClassDescription:
                        controller.AcademyList[index].pieceClassDescription,
                  ),
                  childCount: controller.AcademyList.length,
                ),
              ),
            ],
          ),
        ),
        // TODO(ghrud92): 탭바 추가
      ));
}
