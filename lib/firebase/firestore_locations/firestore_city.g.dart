// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreCity _$FirestoreCityFromJson(Map<String, dynamic> json) =>
    FirestoreCity(
      name: json['name'] as String,
      districts: (json['districts'] as List<dynamic>)
          .map((e) => FirestoreDistrict.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirestoreCityToJson(FirestoreCity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'districts': instance.districts,
    };
