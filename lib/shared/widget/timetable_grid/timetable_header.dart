import 'package:flutter/material.dart';

class TimetableHeader extends StatelessWidget {
  const TimetableHeader({super.key});

  @override
  Widget build(BuildContext context) => Container(
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
      );

  double get _weekColumnHeight => 30;

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
}
