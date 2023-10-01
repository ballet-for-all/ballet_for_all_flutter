import 'package:flutter/material.dart';

class PricingHeader extends StatelessWidget {
  const PricingHeader({
    required this.planFlex,
    required this.classTimeFlex,
    required this.countFlex,
    required this.durationInMonthFlex,
    required this.priceFlex,
    super.key,
  });

  final int planFlex;
  final int classTimeFlex;
  final int countFlex;
  final int durationInMonthFlex;
  final int priceFlex;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: const Color(0xFFF4F4F4),
        child: Row(
          children: [
            Flexible(
              flex: planFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('강좌명', style: _textStyle),
              ),
            ),
            Flexible(
              flex: classTimeFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('시간', style: _textStyle),
              ),
            ),
            Flexible(
              flex: countFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('횟수', style: _textStyle),
              ),
            ),
            Flexible(
              flex: durationInMonthFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('기간', style: _textStyle),
              ),
            ),
            Flexible(
              flex: priceFlex,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('금액', style: _textStyle),
              ),
            ),
          ],
        ),
      );

  TextStyle get _textStyle => const TextStyle(
        fontSize: 13,
        color: Color(0xFF999999),
      );
}
