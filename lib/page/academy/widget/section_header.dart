import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.onShowAll,
    super.key,
  });

  final String title;
  final VoidCallback onShowAll;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF222222),
            ),
          ),
          InkWell(
            onTap: onShowAll,
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                '전체보기',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF0066FF),
                ),
              ),
            ),
          )
        ],
      );
}
