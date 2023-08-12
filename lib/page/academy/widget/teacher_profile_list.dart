import 'package:flutter/material.dart';

import '../../../repository/academy/teacher.dart';
import '../../../shared/extension/widget_list_extension.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '강사 소개',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        '전체보기',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  )
                ],
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
