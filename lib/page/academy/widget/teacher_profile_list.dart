import 'package:flutter/material.dart';

import '../../../repository/academy/teacher.dart';
import '../../../shared/extension/widget_list_extension.dart';
import 'section_header.dart';
import 'teacher_profile_tile.dart';

const _maxTeacherProfileCount = 3;

class TeacherProfileList extends StatelessWidget {
  const TeacherProfileList({required this.teachers, super.key});

  final List<Teacher> teachers;

  @override
  Widget build(BuildContext context) => teachers.isEmpty
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              SectionHeader(
                title: '강사 소개',
                onShowAll: () => debugPrint('강사 소개'),
              ),
              const SizedBox(height: 10),
              Column(
                children: teachers
                    .take(_maxTeacherProfileCount)
                    .map((teacher) => TeacherProfileTile(teacher: teacher))
                    .toList()
                    .withSeperator(
                      const SizedBox(height: 10),
                    ),
              )
            ],
          ),
        );
}
