import 'package:cloud_firestore/cloud_firestore.dart';

import '../../firebase/firestore_collection.dart';
import 'academy.dart';

class AcademyRepository extends FirestoreCollection {
  Future<List<Academy>> listAcademies() async {
    final academyJsonList =
        await FirebaseFirestore.instance.collection('academies').get();
    final academies = academyJsonList.docs
        .map((doc) => queryDocumentSnapshotToMap(doc))
        .toList();
    return academies
        .map((academyJson) => Academy.fromJson(academyJson))
        .toList();
  }

  Future<Academy> getAcademy(String id) async {
    final academyJson =
        await FirebaseFirestore.instance.collection('academies').doc(id).get();
    return Academy.fromJson(documentSnapshotToMap(academyJson));
  }
}
