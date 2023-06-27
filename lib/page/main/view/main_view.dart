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
                  height: 440,
                  color: Colors.grey.shade200,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => AcademyListTile(
                    academyImages: widget.academies[index].images,
                    academyName: widget.academies[index].name,
                    academyAddress: widget.academies[index].address,
                    regularPrice: widget.academies[index].minRegularPrice,
                    couponPrice: widget.academies[index].minCouponPrice,
                    pieceClassDescription:
                        widget.academies[index].pieceClassDescription,
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
