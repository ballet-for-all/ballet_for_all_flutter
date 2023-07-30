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
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xFFC6C6C6),
            ),
          ),
        ),
      );
}
