// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Academy _$AcademyFromJson(Map<String, dynamic> json) => Academy(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: (json['phone'] as List<dynamic>).map((e) => e as String).toList(),
      sns: Sns.fromJson(json['sns'] as Map<String, dynamic>),
      coupon: json['coupon'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      teachers: (json['teachers'] as List<dynamic>)
          .map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      timetables: (json['timetables'] as List<dynamic>?)
          ?.map((e) => Timetable.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricing: (json['pricing'] as List<dynamic>?)
          ?.map((e) => Pricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingDescription: json['pricingDescription'] as String?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcademyToJson(Academy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'sns': instance.sns.toJson(),
      'coupon': instance.coupon,
      'images': instance.images,
      'teachers': instance.teachers.map((e) => e.toJson()).toList(),
      'timetables': instance.timetables?.map((e) => e.toJson()).toList(),
      'pricing': instance.pricing?.map((e) => e.toJson()).toList(),
      'pricingDescription': instance.pricingDescription,
      'location': instance.location.toJson(),
    };
