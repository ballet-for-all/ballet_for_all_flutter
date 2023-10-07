import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../shared/widget/app_bar_action_button.dart';
import 'main_controller.dart';
import 'widget/academy_list_title.dart';

class MainPage extends GetView<MainController> {
  static const routeName = '/main';

  const MainPage({super.key});

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
                  child: const Padding(
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
                    id: controller.academyList[index].id,
                    onPressed: () => controller.onAcademyClick(index),
                    academyImages: controller.academyList[index].images,
                    academyName: controller.academyList[index].name,
                    academyAddress: controller.academyList[index].address,
                    regularPrice: controller.academyList[index].minRegularPrice,
                    couponPrice: controller.academyList[index].minCouponPrice,
                    pieceClassDescription:
                        controller.academyList[index].pieceClassDescription,
                  ),
                  childCount: controller.academyList.length,
                ),
              ),
            ],
          ),
        ),
        // TODO(ghrud92): 탭바 추가
      ));
}
