import 'package:ballet_for_all_flutter/auth/auth_cubit.dart';
import 'package:ballet_for_all_flutter/auth/auth_state.dart';
import 'package:ballet_for_all_flutter/auth/selected_location.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthCubit', () {
    blocTest<AuthCubit, AuthState>(
      '어떤 함수도 불리지 않았을 때는 기본 AuthState를 갖는다.',
      build: () => AuthCubit(),
      expect: () => [],
      verify: (cubit) {
        expect(cubit.state, const AuthState());
      },
    );

    group('updateLocation', () {
      blocTest<AuthCubit, AuthState>(
        'updateLocation을 불렀을 때, 기존 값에 상관없이 AuthState의 selectedLocation이 모두 업데이트 된다.',
        build: () => AuthCubit(),
        seed: () => const AuthState(
          selectedLocation: SelectedLocation(
            city: '부산광역시',
            district: '부산진구',
            block: '부전동',
          ),
        ),
        act: (cubit) => cubit.updateLocation('서울특별시', '종로구', '청운동'),
        expect: () => [
          const AuthState(
            selectedLocation: SelectedLocation(
              city: '서울특별시',
              district: '종로구',
              block: '청운동',
            ),
          ),
        ],
      );

      blocTest<AuthCubit, AuthState>(
        'district가 null인 값으로 updateLocation을 불렀을 때, AuthState의 selectedLocation이 업데이트 된다.',
        build: () => AuthCubit(),
        act: (cubit) => cubit.updateLocation('서울특별시', null, '청운동'),
        expect: () => [
          const AuthState(
            selectedLocation: SelectedLocation(
              city: '서울특별시',
              district: null,
              block: '청운동',
            ),
          ),
        ],
      );

      blocTest(
        'block이 null인 값으로 updateLocation을 불렀을 때, AuthState의 selectedLocation이 업데이트 된다.',
        build: () => AuthCubit(),
        act: (cubit) => cubit.updateLocation('서울특별시', '종로구', null),
        expect: () => [
          const AuthState(
            selectedLocation: SelectedLocation(
              city: '서울특별시',
              district: '종로구',
              block: null,
            ),
          ),
        ],
      );
    });
  });
}
