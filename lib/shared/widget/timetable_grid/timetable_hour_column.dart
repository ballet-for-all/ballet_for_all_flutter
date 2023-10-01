import 'package:flutter/material.dart';

import 'timetable_grid.dart';

class TimetableHourColumn extends StatelessWidget {
  const TimetableHourColumn({super.key});

  @override
  Widget build(BuildContext context) {
    const hourStyle = TextStyle(
      fontSize: 12,
      color: Color(0xFFBBBBBB),
    );

    return const Column(
      children: [
        SizedBox(height: TimetableGrid.halfHourHeight * 4),
        SizedBox(
          height: TimetableGrid.halfHourHeight * 2,
          child: Center(
            child: Text(
              '09:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: TimetableGrid.halfHourHeight * 4),
        SizedBox(
          height: TimetableGrid.halfHourHeight * 2,
          child: Center(
            child: Text(
              '12:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: TimetableGrid.halfHourHeight * 4),
        SizedBox(
          height: TimetableGrid.halfHourHeight * 2,
          child: Center(
            child: Text(
              '15:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: TimetableGrid.halfHourHeight * 4),
        SizedBox(
          height: TimetableGrid.halfHourHeight * 2,
          child: Center(
            child: Text(
              '18:00',
              style: hourStyle,
            ),
          ),
        ),
        SizedBox(height: TimetableGrid.halfHourHeight * 4),
        SizedBox(
          height: TimetableGrid.halfHourHeight * 2,
          child: Center(
            child: Text(
              '21:00',
              style: hourStyle,
            ),
          ),
        ),
      ],
    );
  }
}
