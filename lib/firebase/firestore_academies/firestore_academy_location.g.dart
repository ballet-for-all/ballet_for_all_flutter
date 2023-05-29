// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_academy_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreAcademyLocation _$FirestoreAcademyLocationFromJson(
        Map<String, dynamic> json) =>
    FirestoreAcademyLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      city: json['city'] as String,
      district: json['district'] as String,
      block: json['block'] as String,
    );

Map<String, dynamic> _$FirestoreAcademyLocationToJson(
        FirestoreAcademyLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'city': instance.city,
      'district': instance.district,
      'block': instance.block,
    };
