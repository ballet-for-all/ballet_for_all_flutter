import 'package:flutter/material.dart';

class TermItem extends StatelessWidget {
  const TermItem({
    required this.text,
    required this.textStyle,
    required this.onClick,
    required this.checked,
    this.option,
    this.infoUrl,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final VoidCallback onClick;
  final bool checked;
  final String? option;
  final String? infoUrl;

  @override
  Widget build(BuildContext context) {
    final String iconPath;
    if (checked) {
      iconPath = 'assets/icons/checkbox-on.png';
    } else {
      iconPath = 'assets/icons/checkbox-off.png';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 21,
                height: 21,
                child: Image.asset(iconPath),
              ),
              const SizedBox(width: 6),
              Text(text, style: textStyle),
              if (option != null)
                Text(
                  '($option)',
                  style: textStyle.copyWith(color: const Color(0xFFD73535)),
                ),
            ],
          ),
          if (infoUrl != null)
            InkWell(
              onTap: () {
                // TODO(ghrud92): Implement this.
              },
              child: Text(
                '보기',
                style: textStyle.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
