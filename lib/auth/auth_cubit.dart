import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';
import 'selected_location.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void updateLocation(String city, String? district, String? block) {
    emit(state.copyWith(
      selectedLocation: SelectedLocation(
        // NOTE: district나 block을 전체를 골랐다면 구 또는 동 이름이 비어있을 수 있다.
        // 구 이름의 경우 필요하다면 kakao map api를 사용해서 구 이름을 가져올 수 있다.
        city: city,
        district: district,
        block: block,
      ),
    ));
  }
}
