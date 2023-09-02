import 'package:flutter/material.dart';

import '../../../shared/widget/image_carousel.dart';
import 'class_info.dart';

class AcademyListTile extends StatelessWidget {
  const AcademyListTile({
    required this.id,
    required this.onPressed,
    required this.academyImages,
    required this.academyName,
    required this.academyAddress,
    required this.regularPrice,
    required this.couponPrice,
    required this.pieceClassDescription,
    Key? key,
  }) : super(key: key);

  final String id;
  final VoidCallback onPressed;
  final List<String> academyImages;
  final String academyName;
  final String academyAddress;
  final int? regularPrice;
  final int? couponPrice;
  final String? pieceClassDescription;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ImageCarousel(
                  height: 202,
                  images: academyImages,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  academyName,
                                  style: const TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFFBBBBBB),
                                      size: 18,
                                    ),
                                    Text(
                                      academyAddress,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFBBBBBB),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Color(0xFFE5E5E5),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ClassInfo(
                        leadingIconPath: 'assets/icons/regular-class.svg',
                        title: '정규수업',
                        price: regularPrice,
                        showPerClass: true,
                        exist: regularPrice != null,
                        notExistDescription: '정규 수업이 없어요',
                      ),
                      const SizedBox(height: 10),
                      ClassInfo(
                        leadingIconPath: 'assets/icons/coupon-class.svg',
                        title: '쿠폰수업',
                        price: couponPrice,
                        exist: couponPrice != null,
                        notExistDescription: '쿠폰 수업이 없어요',
                      ),
                      const SizedBox(height: 10),
                      ClassInfo(
                        leadingIconPath: 'assets/icons/piece-class.svg',
                        title: '작품반',
                        description: pieceClassDescription,
                        exist: pieceClassDescription != null,
                        notExistDescription: '작품 수업이 없어요',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
