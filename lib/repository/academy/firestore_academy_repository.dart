import '../../firebase/firestore_academies/firestore_academies_collection.dart';
import 'academy.dart';
import 'academy_repository.dart';

class FirestoreAcademyRepository implements AcademyRepository {
  FirestoreAcademyRepository({required this.collection});

  final FirestoreAcademiesCollection collection;

  // TODO(ghrud92): Unit test 추가
  @override
  Future<List<Academy>> listAcademies() async {
    final academyJsonList = await collection.getAcademies();
    return academyJsonList
        .map((academyJson) => Academy.fromJson(academyJson))
        .toList();
  }
}
