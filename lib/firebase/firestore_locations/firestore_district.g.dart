// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreDistrict _$FirestoreDistrictFromJson(Map<String, dynamic> json) =>
    FirestoreDistrict(
      name: json['name'] as String,
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => FirestoreBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirestoreDistrictToJson(FirestoreDistrict instance) =>
    <String, dynamic>{
      'name': instance.name,
      'blocks': instance.blocks,
    };
