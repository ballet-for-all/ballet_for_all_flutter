import 'package:flutter/material.dart';

class LocationListItem extends StatelessWidget {
  const LocationListItem({
    required this.text,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF222222) : Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : const Color(0xFF999999),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
}
