import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth_cubit.dart';
import '../../../auth/auth_state.dart';
import '../../../repository/academy/academy_repository.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_state.dart';
import 'main_view.dart';

// TODO(ghrud92): AcademyListPage 로 이름 변경
@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MainCubit(
          academyRepository: context.read<AcademyRepository>(),
        ),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) => BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              final cubit = BlocProvider.of<MainCubit>(context);
              return MainView(
                currentLocation: authState.selectedLocation.deepestLocation,
                academies: state.academies,
                onLoadAcademies: cubit.loadAcademies,
              );
            },
          ),
        ),
      );
}
