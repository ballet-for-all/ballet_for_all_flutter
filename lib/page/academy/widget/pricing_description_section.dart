import 'package:flutter/material.dart';

class PricingDescriptionSection extends StatelessWidget {
  const PricingDescriptionSection({required this.description, super.key});

  final String? description;

  @override
  Widget build(BuildContext context) => description == null
      ? const SizedBox.shrink()
      : Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          color: const Color(0xFFFAFAFA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '학원 할인 정보 및 약관',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF666666),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        );
}
