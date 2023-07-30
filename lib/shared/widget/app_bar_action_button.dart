import 'package:flutter/material.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({
    required this.onPressed,
    this.label,
    this.icon,
    this.color = const Color(0xFF222222),
    this.backgroundColor = const Color(0xFFF5F5F5),
    super.key,
  }) : assert(label != null || icon != null);

  final VoidCallback onPressed;
  final String? label;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 9),
          padding: const EdgeInsets.symmetric(horizontal: 9),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(38),
          ),
          child: Center(child: label != null ? _withLabel : _onlyIcon),
        ),
      );

  Widget get _withLabel => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label!,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 5),
          if (icon != null)
            Icon(
              icon!,
              size: 14,
              color: color,
            ),
        ],
      );

  Widget get _onlyIcon => Icon(
        icon!,
        size: 20,
        color: color,
      );
}
