import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../shared/widget/app_bar_action_button.dart';
import '../../../shared/widget/app_bar_leading_button.dart';
import 'academy_default_info.dart';

class AcademyView extends StatelessWidget {
  const AcademyView({
    required this.id,
    required this.images,
    required this.name,
    required this.address,
    super.key,
  });

  final String id;
  final List<String> images;
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: const AppBarLeadingButton(),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              actions: [
                // TODO(ghrud92): 액션 버튼 색 변경
                AppBarActionButton(
                  onPressed: () {},
                  icon: Icons.ios_share,
                ),
                const SizedBox(width: 4),
                AppBarActionButton(
                  onPressed: () {},
                  icon: Icons.favorite_border,
                ),
                const SizedBox(width: 12),
              ],
            ),
            extendBodyBehindAppBar: true,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 266,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) => SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      images[index],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                // TODO(ghrud92): Carousel indicator 추가
                AcademyDefaultInfo(name: name, address: address),
                const Divider(
                  color: Color(0xFFE5E5E5),
                ),
              ],
            ),
          ),
        ),
      );
}
