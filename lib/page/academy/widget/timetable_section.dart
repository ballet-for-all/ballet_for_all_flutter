import 'package:flutter/material.dart';

import '../../../repository/academy/timetable.dart';
import '../../../shared/widget/timetable_grid.dart';
import 'section_header.dart';

class TimetableSection extends StatelessWidget {
  const TimetableSection({required this.timetables, super.key});

  final List<Timetable> timetables;

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
              // TODO(ghrud92): Add timetable name buttons
              const SizedBox(height: 10),
              TimetableGrid(classes: timetables.first.classes),
            ],
          ),
        );
}
