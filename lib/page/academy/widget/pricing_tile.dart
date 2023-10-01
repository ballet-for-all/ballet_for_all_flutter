import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../repository/academy/pricing.dart';

class PricingTile extends StatelessWidget {
  const PricingTile({
    required this.planFlex,
    required this.classTimeFlex,
    required this.countFlex,
    required this.durationInMonthFlex,
    required this.priceFlex,
    required this.pricing,
    super.key,
  });

  final int planFlex;
  final int classTimeFlex;
  final int countFlex;
  final int durationInMonthFlex;
  final int priceFlex;
  final Pricing pricing;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
              flex: planFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  pricing.plan,
                  style: _textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              flex: classTimeFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _classTimeText,
                  style: _textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              flex: countFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _countText,
                  style: _textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              flex: durationInMonthFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _durationInMonthText,
                  style: _textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              flex: priceFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _pricingText,
                  style: _textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  TextStyle get _textStyle => const TextStyle(
        fontSize: 14,
        color: Colors.black,
      );

  String get _classTimeText => '${pricing.classTimeInMinutes}분';

  String get _countText {
    if (pricing.totalCount == -1) {
      return '무제한';
    }
    if (pricing.totalCount != null) {
      return '${pricing.totalCount}회';
    }
    return '주${pricing.numberPerWeek}회';
  }

  String get _durationInMonthText => '${pricing.durationInMonth}개월';

  String get _pricingText {
    final format = NumberFormat.currency(locale: 'ko_KR', symbol: '');
    final formatted = format.format(pricing.originalPrice);
    return '$formatted원';
  }
}
