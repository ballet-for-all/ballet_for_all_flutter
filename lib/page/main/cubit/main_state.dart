import 'package:equatable/equatable.dart';

import '../../../repository/academy/academy.dart';

class MainState extends Equatable {
  const MainState({
    this.academies = const [],
  });

  final List<Academy> academies;

  MainState copyWith({
    List<Academy>? academies,
  }) =>
      MainState(
        academies: academies ?? this.academies,
      );

  @override
  List<Object> get props => [academies];
}
