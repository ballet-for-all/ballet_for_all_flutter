import 'package:flutter/material.dart';

class AcademyView extends StatelessWidget {
  const AcademyView({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) => Center(
        child: Text('AcademyView $id'),
      );
}
