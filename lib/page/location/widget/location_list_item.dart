import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller.dart';

class LocationListItem extends GetView<LocationController> {
  const LocationListItem({
    required this.text,
    this.selected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool selected;
  final VoidCallback? onTap;

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
                fontWeight: selected ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
          ),
        ),
      );
}
