import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'main_view.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MainView();
}
