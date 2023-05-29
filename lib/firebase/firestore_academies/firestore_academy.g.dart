// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_academy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreAcademy _$FirestoreAcademyFromJson(Map<String, dynamic> json) =>
    FirestoreAcademy(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: (json['phone'] as List<dynamic>).map((e) => e as String).toList(),
      sns: FirestoreSns.fromJson(json['sns'] as Map<String, dynamic>),
      coupon: json['coupon'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      teachers: (json['teachers'] as List<dynamic>)
          .map((e) => FirestoreTeacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      timetables: (json['timetables'] as List<dynamic>?)
          ?.map((e) => FirestoreTimetable.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricing: (json['pricing'] as List<dynamic>?)
          ?.map((e) => FirestorePricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingDescription: json['pricingDescription'] as String?,
      location: FirestoreAcademyLocation.fromJson(
          json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FirestoreAcademyToJson(FirestoreAcademy instance) =>
    <String, dynamic>{
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
