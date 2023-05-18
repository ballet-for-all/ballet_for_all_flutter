import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth_cubit.dart';
import '../../../auth/auth_state.dart';
import 'main_view.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final String deepestLocation = _getDeepestLocation(
            // NOTE: 메인 페이지에 들어왔다면 city는 null이 될 수 없다.
            state.selectedLocation.city!,
            state.selectedLocation.district,
            state.selectedLocation.block,
          );

          return MainView(
            currentLocation: deepestLocation,
          );
        },
      );

  String _getDeepestLocation(String city, String? district, String? block) {
    if (block != null) {
      return block;
    } else if (district != null) {
      return district;
    } else {
      return city;
    }
  }
}
