import 'package:flutter/material.dart';

import '../../../repository/academy/teacher.dart';

class TeacherProfileTile extends StatelessWidget {
  const TeacherProfileTile({required this.teacher, super.key});

  final Teacher teacher;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Image.network(
            teacher.imageUrl,
            width: 115,
            height: 115,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teacher.name,
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    height: 1.5,
                  ),
                ),
                Text(
                  teacher.description,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    height: 1.5,
                  ),
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ],
      );
}
