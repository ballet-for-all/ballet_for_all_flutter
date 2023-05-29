import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'firestore_academy_location.dart';
import 'firestore_pricing.dart';
import 'firestore_sns.dart';
import 'firestore_teacher.dart';
import 'firestore_timetable.dart';

part 'firestore_academy.g.dart';

@JsonSerializable(explicitToJson: true)
class FirestoreAcademy {
  FirestoreAcademy({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.sns,
    required this.coupon,
    required this.images,
    required this.teachers,
    required this.timetables,
    required this.pricing,
    required this.pricingDescription,
    required this.location,
  });

  factory FirestoreAcademy.fromJson(Map<String, dynamic> json) =>
      _$FirestoreAcademyFromJson(json);

  factory FirestoreAcademy.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw Exception('FirestoreAcademy is null');
    }
    return FirestoreAcademy.fromJson({
      'id': snapshot.id,
      ...data,
    });
  }

  final String id;
  final String name;
  final String address;
  final List<String> phone;
  final FirestoreSns sns;
  final bool coupon;
  final List<String> images;
  final List<FirestoreTeacher> teachers;
  final List<FirestoreTimetable>? timetables;
  final List<FirestorePricing>? pricing;
  final String? pricingDescription;
  final FirestoreAcademyLocation location;

  Map<String, dynamic> toJson() => _$FirestoreAcademyToJson(this);

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }

  @override
  String toString() =>
      'FirestoreAcademy{id: $id, name: $name, address: $address, phone: $phone, sns: $sns, '
      'coupon: $coupon, images: $images, teachers: $teachers, timetables: $timetables, pricing: '
      '$pricing, pricingDescription: $pricingDescription, location: $location}';
}
