import 'package:flutter/material.dart';

import '../../../repository/academy/timetable.dart';
import '../../../shared/widget/timetable_grid/timetable_grid.dart';
import 'section_header.dart';

class TimetableSection extends StatelessWidget {
  const TimetableSection({
    required this.timetables,
    required this.selectedIndex,
    required this.onTimetableSelected,
    super.key,
  });

  final List<Timetable> timetables;
  final int selectedIndex;
  final void Function(int) onTimetableSelected;

  @override
  Widget build(BuildContext context) => timetables.isEmpty
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              SectionHeader(
                title: '시간표',
                onShowAll: () => debugPrint('시간표'),
              ),
              if (timetables.length > 2) ...[
                const SizedBox(height: 10),
                _timetableNameButtons,
              ],
              const SizedBox(height: 10),
              TimetableGrid(classes: timetables[selectedIndex].classes),
            ],
          ),
        );

  Widget get _timetableNameButtons => SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: timetables.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              backgroundColor: index == selectedIndex
                  ? Colors.black
                  : const Color(0xFFEEEEEE),
              foregroundColor: index == selectedIndex
                  ? Colors.white
                  : const Color(0xFFBBBBBB),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () => onTimetableSelected(index),
            child: Text(
              timetables[index].timetableName ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                    index == selectedIndex ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        ),
      );
}
