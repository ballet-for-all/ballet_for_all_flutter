import 'package:flutter/material.dart';

class SafeBottomButton extends StatelessWidget {
  const SafeBottomButton({
    required this.onTap,
    required this.child,
    this.height = 56,
    this.foregroundColor = Colors.white,
    this.backgroundColor = const Color(0xFF222222),
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final int height;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final safePaddingBottom = MediaQuery.of(context).padding.bottom;
    return SizedBox(
      width: double.infinity,
      height: height + safePaddingBottom,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
          elevation: 0,
          padding: EdgeInsets.only(bottom: safePaddingBottom),
          disabledForegroundColor: const Color(0xFFBBBBBB),
          disabledBackgroundColor: const Color(0xFFE5E5E5),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
