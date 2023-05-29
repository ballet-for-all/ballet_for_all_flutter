import 'package:json_annotation/json_annotation.dart';

import 'firestore_class.dart';

part 'firestore_timetable.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreTimetable {
  FirestoreTimetable({
    required this.timetableName,
    required this.classes,
  });

  factory FirestoreTimetable.fromJson(Map<String, dynamic> json) =>
      _$FirestoreTimetableFromJson(json);

  final String? timetableName;
  final List<FirestoreClass>? classes;

  Map<String, dynamic> toJson() => _$FirestoreTimetableToJson(this);

  @override
  String toString() =>
      'FirestoreTimetable{timetableName: $timetableName, classes: $classes}';
}
