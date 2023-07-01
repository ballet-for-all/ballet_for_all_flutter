import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ClassInfo extends StatelessWidget {
  const ClassInfo({
    required this.leadingIconPath,
    required this.title,
    required this.exist,
    required this.notExistDescription,
    this.price,
    this.showPerClass,
    this.description,
    Key? key,
  }) : super(key: key);

  final String leadingIconPath;
  final String title;
  final bool exist;
  final String notExistDescription;
  final int? price;
  final bool? showPerClass;
  final String? description;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                leadingIconPath,
                width: 20,
                colorFilter: exist
                    ? null
                    : const ColorFilter.mode(
                        Color(0xFFE5E5E5), BlendMode.srcIn),
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color:
                      exist ? const Color(0xFF222222) : const Color(0xFFE5E5E5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (exist) _priceOrDescriptionWidget,
          if (!exist) _notExistDescriptionWidget,
        ],
      );

  Widget get _priceOrDescriptionWidget {
    if (price != null) {
      final priceFormat = NumberFormat.decimalPattern('ko');
      final priceText = RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: priceFormat.format(price),
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF222222),
                fontWeight: FontWeight.w700,
              ),
            ),
            const TextSpan(
              text: '원~',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF222222),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
      if (showPerClass == true) {
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Color(0xFFEBEBEB),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: const Center(
                child: Text(
                  '회당',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 3),
            priceText,
          ],
        );
      } else {
        return priceText;
      }
    } else {
      return Text(
        description!,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF222222),
          fontWeight: FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  Widget get _notExistDescriptionWidget => Text(
        notExistDescription,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFFE5E5E5),
        ),
        overflow: TextOverflow.ellipsis,
      );
}
