import 'academy.dart';

abstract class AcademyRepository {
  Future<List<Academy>> listAcademies();
}
