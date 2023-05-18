import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({required this.currentLocation, Key? key}) : super(key: key);

  final String currentLocation;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Main')),
        body: Center(child: Text(currentLocation)),
      );
}
