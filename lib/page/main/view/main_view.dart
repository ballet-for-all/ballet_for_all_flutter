import 'package:flutter/material.dart';

import '../../../repository/academy/academy.dart';
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
        body: Container(
          color: const Color(0xFFF5F5F5),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 440,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Text('마케팅 박스'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  // color: const Color(0xFFF5F5F5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.currentLocation,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO(ghrud92): 디자인 적용 & 순서 변경 동작 구현
                        },
                        child: const Text('조회순'),
                      ),
                    ],
                  ),
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
