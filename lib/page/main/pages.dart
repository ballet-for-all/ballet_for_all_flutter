import 'package:ballet_for_all_flutter/page/main/widget/academy_list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../repository/academy/academy.dart';
import '../../../shared/widget/app_bar_action_button.dart';
import 'controller.dart';


//mainview쪽
class MainView extends GetView<MainController> {
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
              label: '${controller.myLocation.value}',
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
                  margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5282FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                    id: controller.list[index].id,
                    academyImages: controller.list[index].images,
                    academyName: controller.list[index].name,
                    academyAddress: controller.list[index].address,
                    regularPrice: controller.list[index].minRegularPrice,
                    couponPrice: controller.list[index].minCouponPrice,
                    pieceClassDescription:
                        controller.list[index].pieceClassDescription,
                  ),
                  childCount: controller.list.length,
                ),
              ),
            ],
          ),
        ), 
        // TODO(ghrud92): 탭바 추가
      )); 
}
