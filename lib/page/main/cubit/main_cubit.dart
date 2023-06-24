import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/academy/academy_repository.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.academyRepository,
  }) : super(const MainState());

  final AcademyRepository academyRepository;

  // TODO(ghrud92): 지역에 해당하는 학원 목록을 불러오도록 변경
  Future<void> loadAcademies() async {
    final academies = await academyRepository.listAcademies();
    emit(state.copyWith(academies: academies));
  }
}
