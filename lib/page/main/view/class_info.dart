import 'package:flutter/material.dart';

class ClassInfo extends StatelessWidget {
  const ClassInfo({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF222222),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}
