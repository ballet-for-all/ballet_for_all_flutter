import 'package:json_annotation/json_annotation.dart';

part 'firestore_pricing.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestorePricing {
  FirestorePricing({
    required this.numberPerWeek,
    required this.totalCount,
    required this.durationInMonth,
    required this.classTimeInMinutes,
    required this.plan,
    required this.originalPrice,
    required this.salePrice,
    required this.discountRate,
  });

  factory FirestorePricing.fromJson(Map<String, dynamic> json) =>
      _$FirestorePricingFromJson(json);

  final int? numberPerWeek;
  final double? totalCount;
  final int durationInMonth;
  final int classTimeInMinutes;
  final String plan;
  final int originalPrice;
  final int salePrice;
  final double discountRate;

  Map<String, dynamic> toJson() => _$FirestorePricingToJson(this);

  @override
  String toString() =>
      'FirestorePricing{numberPerWeek: $numberPerWeek, totalCount: $totalCount, durationInMonth: '
      '$durationInMonth, classTimeInMinutes: $classTimeInMinutes, plan: $plan, originalPrice: '
      '$originalPrice, salePrice: $salePrice, discountRate: $discountRate}';
}
