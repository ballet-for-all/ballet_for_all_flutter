import 'package:flutter/material.dart';

class AcademyTabBar extends StatelessWidget {
  const AcademyTabBar({super.key});

  static const double height = 60;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
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
          ],
        ),
      );

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
