import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarLeadingButton extends StatelessWidget {
  const AppBarLeadingButton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: InkWell(
          onTap: () => context.popRoute(),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xFF222222),
            ),
          ),
        ),
      );
}
