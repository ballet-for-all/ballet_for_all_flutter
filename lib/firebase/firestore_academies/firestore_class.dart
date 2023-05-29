import 'package:json_annotation/json_annotation.dart';

import 'firestore_schedule.dart';

part 'firestore_class.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreClass {
  FirestoreClass({
    required this.className,
    required this.classTag,
    required this.schedules,
  });

  factory FirestoreClass.fromJson(Map<String, dynamic> json) =>
      _$FirestoreClassFromJson(json);

  final String className;
  final int classTag;
  final List<FirestoreSchedule> schedules;

  Map<String, dynamic> toJson() => _$FirestoreClassToJson(this);

  @override
  String toString() =>
      'FirestoreClass{className: $className, classTag: $classTag, schedules: $schedules}';
}
