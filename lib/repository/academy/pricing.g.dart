// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      numberPerWeek: json['numberPerWeek'] as int?,
      totalCount: json['totalCount'] as int?,
      durationInMonth: json['durationInMonth'] as int?,
      classTimeInMinutes: json['classTimeInMinutes'] as int?,
      plan: json['plan'] as String,
      originalPrice: json['originalPrice'] as int,
      salePrice: json['salePrice'] as int?,
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'numberPerWeek': instance.numberPerWeek,
      'totalCount': instance.totalCount,
      'durationInMonth': instance.durationInMonth,
      'classTimeInMinutes': instance.classTimeInMinutes,
      'plan': instance.plan,
      'originalPrice': instance.originalPrice,
      'salePrice': instance.salePrice,
      'discountPercent': instance.discountPercent,
    };
