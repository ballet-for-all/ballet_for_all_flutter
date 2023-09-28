import 'package:flutter/material.dart';

import '../../../repository/academy/clazz.dart';
import '../../../repository/academy/schedule.dart';
import 'timetable_header.dart';
import 'timetable_hour_column.dart';

class TimetableGrid extends StatelessWidget {
  const TimetableGrid({required this.classes, super.key});

  final List<Clazz> classes;

  static const double halfHourHeight = 10;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const TimetableHeader(),
          const Divider(color: Colors.white, height: 0),
          Container(
            height: halfHourHeight * _totalTimeBox,
            color: const Color(0xFFF4F4F4),
            child: Row(
              children: [
                const Expanded(child: TimetableHourColumn()),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('월요일')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('화요일')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('수요일')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('목요일')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('금요일')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('토요일')),
                const VerticalDivider(color: Colors.white, width: 0),
                Expanded(child: _dayColumn('일요일')),
              ],
            ),
          ),
        ],
      );

  int get _totalTimeBox => 34; // 30분 단위로 17시간(06시 30분 ~ 23시 30분)

  Widget _dayColumn(String day) => Stack(
        children: [
          const Column(
            children: [
              SizedBox(height: halfHourHeight * 5),
              Divider(color: Colors.white, height: 0),
              SizedBox(height: halfHourHeight * 6),
              Divider(color: Colors.white, height: 0),
              SizedBox(height: halfHourHeight * 6),
              Divider(color: Colors.white, height: 0),
              SizedBox(height: halfHourHeight * 6),
              Divider(color: Colors.white, height: 0),
              SizedBox(height: halfHourHeight * 6),
              Divider(color: Colors.white, height: 0),
            ],
          ),
          ...classes
              .map((clazz) => _dayClazzToScheduleBoxList(clazz, day))
              .expand((element) => element)
              .toList()
        ],
      );

  List<Widget> _dayClazzToScheduleBoxList(Clazz clazz, String day) {
    final name = clazz.className;
    final daySchedules =
        clazz.schedules.where((schedule) => schedule.day == day).toList();
    final scheduleWidgets = daySchedules.map((schedule) {
      final boxTop = _getBoxTop(schedule);
      final boxHeight = _getBoxHeight(schedule);
      return Positioned(
        left: 0,
        right: 0,
        top: boxTop,
        height: boxHeight,
        child: InkWell(
          onTap: () {
            // TODO(ghrud92): Show class detail popup
            debugPrint(clazz.className);
          },
          child: Container(
            color: _getBoxColor(schedule),
            padding: const EdgeInsets.all(3),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }).toList();
    return scheduleWidgets;
  }

  double _getBoxTop(Schedule schedule) {
    final startHour = schedule.startHour;
    final startMinute = schedule.startMinute;
    final startIndex = startHour * 2 + (startMinute / 30).round();
    // NOTE: 06:30의 index를 0으로 만들기 위해 13을 빼줌
    return halfHourHeight * (startIndex - 13);
  }

  double _getBoxHeight(Schedule schedule) {
    final durationInMinutes = schedule.durationInMinutes;
    final length = (durationInMinutes / 30).round();
    return halfHourHeight * length;
  }

  Color _getBoxColor(Schedule schedule) {
    final startHour = schedule.startHour;
    if (startHour < 12) {
      return const Color(0xFFDDD588);
    } else if (startHour < 15) {
      return const Color(0xFF7FB8EC);
    } else if (startHour < 18) {
      return const Color(0xFFF88CE0);
    } else {
      return const Color(0xFFB49FAF);
    }
  }
}
