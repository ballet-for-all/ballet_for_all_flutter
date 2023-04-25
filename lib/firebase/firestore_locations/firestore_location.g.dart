// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreLocation _$FirestoreLocationFromJson(Map<String, dynamic> json) =>
    FirestoreLocation(
      id: json['id'] as String,
      cities: (json['cities'] as List<dynamic>)
          .map((e) => FirestoreCity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirestoreLocationToJson(FirestoreLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cities': instance.cities,
    };
