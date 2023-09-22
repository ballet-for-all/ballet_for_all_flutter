import 'package:flutter/material.dart';

import '../../repository/academy/clazz.dart';

class TimetableGrid extends StatelessWidget {
  const TimetableGrid({required this.classes, super.key});

  final List<Clazz> classes;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: _weekColumnHeight,
            color: const Color(0xFFF4F4F4),
            child: Row(
              children: [
                Expanded(
                  child: _weekBox('시간', color: Colors.black.withOpacity(0.2)),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('월'),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('화'),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('수'),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('목'),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('금'),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('토'),
                ),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(
                  child: _weekBox('일'),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white, height: 0),
          Container(
            height: _halfHourHeight * _totalTimeBox,
            color: const Color(0xFFF4F4F4),
            child: Row(
              children: [
                Expanded(child: _hourColumn),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('월')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('화')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('수')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('목')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('금')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('토')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('일')),
              ],
            ),
          ),
        ],
      );

  double get _weekColumnHeight => 30;
  double get _halfHourHeight => 10;
  int get _totalTimeBox => 34; // 30분 단위로 17시간(06시 30분 ~ 23시 30분)

  Widget _weekBox(String text, {Color? color}) => Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      );

  Widget get _hourColumn {
    const hourStyle = TextStyle(
      fontSize: 12,
      color: Color(0xFFBBBBBB),
    );
    return Column(
      children: [
        SizedBox(height: _halfHourHeight * 4),
        SizedBox(
          height: _halfHourHeight * 2,
          child: const Center(
            child: Text(
              '09:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: _halfHourHeight * 4),
        SizedBox(
          height: _halfHourHeight * 2,
          child: const Center(
            child: Text(
              '12:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: _halfHourHeight * 4),
        SizedBox(
          height: _halfHourHeight * 2,
          child: const Center(
            child: Text(
              '15:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: _halfHourHeight * 4),
        SizedBox(
          height: _halfHourHeight * 2,
          child: const Center(
            child: Text(
              '18:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: _halfHourHeight * 4),
        SizedBox(
          height: _halfHourHeight * 2,
          child: const Center(
            child: Text(
              '21:00',
              style: hourStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dayColumn(String day) => Column(
        children: [
          SizedBox(height: _halfHourHeight * 5),
          const Divider(color: Colors.white, height: 0),
          SizedBox(height: _halfHourHeight * 6),
          const Divider(color: Colors.white, height: 0),
          SizedBox(height: _halfHourHeight * 6),
          const Divider(color: Colors.white, height: 0),
          SizedBox(height: _halfHourHeight * 6),
          const Divider(color: Colors.white, height: 0),
          SizedBox(height: _halfHourHeight * 6),
          const Divider(color: Colors.white, height: 0),
        ],
      );
}
