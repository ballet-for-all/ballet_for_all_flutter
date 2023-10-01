import 'package:flutter/material.dart';

import '../../../repository/academy/pricing.dart';
import 'pricing_header.dart';
import 'pricing_tile.dart';
import 'section_header.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({required this.pricing, super.key});

  final List<Pricing> pricing;

  @override
  Widget build(BuildContext context) => pricing.isEmpty
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              SectionHeader(
                title: '수강료',
                onShowAll: () => debugPrint('수강료'),
              ),
              const SizedBox(height: 10),
              PricingHeader(
                planFlex: _planFlex,
                classTimeFlex: _classTimeFlex,
                countFlex: _countFlex,
                durationInMonthFlex: _durationInMonthFlex,
                priceFlex: _priceFlex,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PricingTile(
                  planFlex: _planFlex,
                  classTimeFlex: _classTimeFlex,
                  countFlex: _countFlex,
                  durationInMonthFlex: _durationInMonthFlex,
                  priceFlex: _priceFlex,
                  pricing: pricing[index],
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFBBBBBB),
                ),
                itemCount: pricing.length,
              ),
            ],
          ),
        );

  int get _planFlex => 3;
  int get _classTimeFlex => 2;
  int get _countFlex => 2;
  int get _durationInMonthFlex => 2;
  int get _priceFlex => 3;
}
