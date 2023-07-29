import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../repository/academy/academy.dart';
import '../../../shared/widget/app_bar_button.dart';
import 'academy_list_tile.dart';

class MainView extends StatefulWidget {
  const MainView({
    required this.currentLocation,
    required this.academies,
    required this.onLoadAcademies,
    Key? key,
  }) : super(key: key);

  final String currentLocation;
  final List<Academy> academies;
  final VoidCallback onLoadAcademies;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    widget.onLoadAcademies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: SvgPicture.asset('assets/icons/wings.svg'),
          ),
          leadingWidth: 56,
          actions: [
            AppBarButton(
              onPressed: () {},
              label: widget.currentLocation,
              icon: Icons.keyboard_arrow_down,
            ),
            const SizedBox(width: 5),
            AppBarButton(
              onPressed: () {},
              icon: Icons.filter_list,
            ),
            const SizedBox(width: 5),
            AppBarButton(
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
                    id: widget.academies[index].id,
                    academyImages: widget.academies[index].images,
                    academyName: widget.academies[index].name,
                    academyAddress: widget.academies[index].address,
                    regularPrice: widget.academies[index].minRegularPrice,
                    couponPrice: widget.academies[index].minCouponPrice,
                    pieceClassDescription: widget.academies[index].pieceClassDescription,
                  ),
                  childCount: widget.academies.length,
                ),
              ),
            ],
          ),
        ),
        // TODO(ghrud92): 탭바 추가
      );
}
