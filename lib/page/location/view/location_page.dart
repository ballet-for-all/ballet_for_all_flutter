import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'location_view.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const LocationView();
}
