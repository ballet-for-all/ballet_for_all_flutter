import 'dart:math';

import 'package:flutter/material.dart';

import 'section_header.dart';

class FacilityPhotoGrid extends StatelessWidget {
  const FacilityPhotoGrid({required this.photos, super.key});

  static const _maxPhotoCount = 9;

  final List<String> photos;

  @override
  Widget build(BuildContext context) => photos.isEmpty
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: <Widget>[
              SectionHeader(
                title: '시설 사진',
                onShowAll: () => debugPrint('시설 사진'),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) => Image.network(
                  photos[index],
                  fit: BoxFit.cover,
                ),
                itemCount: min(photos.length, _maxPhotoCount),
              ),
            ],
          ),
        );
}
