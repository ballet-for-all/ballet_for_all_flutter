import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth_cubit.dart';
import '../../../repository/city/city_repository.dart';
import '../../../router.gr.dart';
import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';
import 'location_view.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<LocationCubit>(
        create: (context) => LocationCubit(
          repository: context.read<CityRepository>(),
        ),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            final authCubit = BlocProvider.of<AuthCubit>(context);
            final cubit = BlocProvider.of<LocationCubit>(context);
            return LocationView(
              cities: state.cities,
              districts: state.districts,
              blocks: state.blocks,
              selectedCity: state.selectedCity,
              selectedDistrict: state.selectedDistrict,
              selectedBlock: state.selectedBlock,
              initializeData: cubit.initialize,
              onCitySelected: cubit.selectCity,
              onDistrictSelected: cubit.selectDistrict,
              onBlockSelected: cubit.selectBlock,
              onConfirmLocation: () {
                final city = state.cities[state.selectedCity].name;
                final district = state.selectedDistrict != 0
                    ? state.districts[state.selectedDistrict].name
                    : null;
                final block = state.selectedBlock != 0
                    ? state.blocks[state.selectedBlock].name
                    : null;
                authCubit.updateLocation(city, district, block);

                context.replaceRoute(const MainRouter());
              },
            );
          },
        ),
      );
}
