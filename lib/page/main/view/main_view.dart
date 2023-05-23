import 'package:flutter/material.dart';

import 'academy_item.dart';

class MainView extends StatelessWidget {
  const MainView({
    required this.currentLocation,
    Key? key,
  }) : super(key: key);

  final String currentLocation;

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
                            currentLocation,
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
                  (context, index) => const AcademyItem(),
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
        // TODO(ghrud92): 탭바 추가
      );
}
