import 'package:flutter/material.dart';

class AcademyTabBar extends StatelessWidget {
  const AcademyTabBar({
    required this.currentTab,
    required this.onTeacherTabPressed,
    required this.onFacilityTabPressed,
    required this.onTimetableTabPressed,
    required this.onCourceFeeTabPressed,
    super.key,
  });

  static const double height = 60;

  final int currentTab;
  final VoidCallback onTeacherTabPressed;
  final VoidCallback onFacilityTabPressed;
  final VoidCallback onTimetableTabPressed;
  final VoidCallback onCourceFeeTabPressed;

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
                        onPressed: onTeacherTabPressed,
                        child: Text(
                          '강사 소개',
                          style: _tabButtonStyle(currentTab == 0),
                        ),
                      ),
                      _tabIndicator(currentTab == 0),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        onPressed: onFacilityTabPressed,
                        child: Text(
                          '시설 사진',
                          style: _tabButtonStyle(currentTab == 1),
                        ),
                      ),
                      _tabIndicator(currentTab == 1),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        onPressed: onTimetableTabPressed,
                        child: Text(
                          '시간표',
                          style: _tabButtonStyle(currentTab == 2),
                        ),
                      ),
                      _tabIndicator(currentTab == 2),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        onPressed: onCourceFeeTabPressed,
                        child: Text(
                          '수강료',
                          style: _tabButtonStyle(currentTab == 3),
                        ),
                      ),
                      _tabIndicator(currentTab == 3),
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
