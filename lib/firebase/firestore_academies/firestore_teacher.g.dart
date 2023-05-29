// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreTeacher _$FirestoreTeacherFromJson(Map<String, dynamic> json) =>
    FirestoreTeacher(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$FirestoreTeacherToJson(FirestoreTeacher instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
