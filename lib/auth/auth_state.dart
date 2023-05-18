import 'package:equatable/equatable.dart';

import 'selected_location.dart';

class AuthState extends Equatable {
  const AuthState({this.selectedLocation = const SelectedLocation()});

  final SelectedLocation selectedLocation;

  AuthState copyWith({
    SelectedLocation? selectedLocation,
  }) =>
      AuthState(
        selectedLocation: selectedLocation ?? this.selectedLocation,
      );

  @override
  List<Object> get props => [selectedLocation];
}
