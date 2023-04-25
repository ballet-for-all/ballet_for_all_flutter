import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/location/location_repository.dart';
import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';
import 'location_view.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<LocationCubit>(
      create: (_) => LocationCubit(
            repository: context.read<LocationRepository>(),
          ),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
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
          );
        },
      ));
}
