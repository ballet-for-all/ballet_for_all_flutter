import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'academy_view.dart';

@RoutePage()
class AcademyPage extends StatelessWidget {
  const AcademyPage({@PathParam('id') required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) => AcademyView(id: id);
}
