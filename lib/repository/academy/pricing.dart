import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pricing.g.dart';

@JsonSerializable(explicitToJson: true)
class Pricing extends Equatable {
  const Pricing({
    required this.numberPerWeek,
    required this.totalCount,
    required this.durationInMonth,
    required this.classTimeInMinutes,
    required this.plan,
    required this.originalPrice,
    required this.salePrice,
    required this.discountPercent,
  }) : assert((numberPerWeek != null) ^ (totalCount != null));

  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);

  final int? numberPerWeek;
  final double? totalCount;
  final int? durationInMonth;
  final int? classTimeInMinutes;
  final String plan;
  final int originalPrice;
  final int? salePrice;
  final double? discountPercent;

  Map<String, dynamic> toJson() => _$PricingToJson(this);

  @override
  List<Object?> get props => [
        numberPerWeek,
        totalCount,
        durationInMonth,
        classTimeInMinutes,
        plan,
        originalPrice,
        salePrice,
        discountPercent,
      ];
}
