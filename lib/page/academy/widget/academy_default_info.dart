import 'package:flutter/material.dart';

import '../../../repository/academy/sns.dart';
import 'sns_icon_buttons.dart';

class AcademyDefaultInfo extends StatelessWidget {
  const AcademyDefaultInfo({
    required this.name,
    required this.address,
    required this.phone,
    required this.sns,
    super.key,
  });

  static const double height = 150;

  final String name;
  final String address;
  final List<String> phone;
  final Sns sns;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AcademyDefaultInfo.height,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFF999999),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SnsIconButtons(phone: phone, sns: sns),
            ],
          ),
        ),
      );
}
