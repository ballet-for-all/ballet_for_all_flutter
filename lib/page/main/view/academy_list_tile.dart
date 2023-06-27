import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'class_info.dart';

class AcademyListTile extends StatefulWidget {
  const AcademyListTile({
    required this.academyImages,
    required this.academyName,
    required this.academyAddress,
    required this.regularPrice,
    required this.couponPrice,
    required this.pieceClassDescription,
    Key? key,
  }) : super(key: key);

  final List<String> academyImages;
  final String academyName;
  final String academyAddress;
  final int? regularPrice;
  final int? couponPrice;
  final String? pieceClassDescription;

  @override
  State<AcademyListTile> createState() => _AcademyListTileState();
}

class _AcademyListTileState extends State<AcademyListTile> {
  late final CarouselController _carouselController;

  int _imageIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat.decimalPattern('ko');
    final String regularPriceDescription;
    if (widget.regularPrice == null) {
      regularPriceDescription = '정규 수업이 없어요';
    } else {
      final regularPrice = priceFormat.format(widget.regularPrice);
      regularPriceDescription = '회당 $regularPrice원~';
    }
    final String couponPriceDescription;
    if (widget.couponPrice == null) {
      couponPriceDescription = '쿠폰 수업이 없어요';
    } else {
      final couponPrice = priceFormat.format(widget.couponPrice);
      couponPriceDescription = '회당 $couponPrice원~';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
      child: InkWell(
        onTap: () {
          // TODO(ghrud92): 학원 상세 페이지로 이동
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 202,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) => setState(() {
                        _imageIndex = index;
                      }),
                    ),
                    itemCount: widget.academyImages.length,
                    itemBuilder: (context, index, realIndex) => SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        widget.academyImages[index],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 20,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DotsIndicator(
                        dotsCount: widget.academyImages.length,
                        position: _imageIndex,
                        decorator: DotsDecorator(
                          color: Colors.white.withOpacity(0.7),
                          activeColor: const Color(0xFF222222),
                        ),
                      ),
                    ),
                  ),
                ],
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
                                widget.academyName,
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
                                    widget.academyAddress,
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
                      title: '정규수업',
                      description: regularPriceDescription,
                      exist: widget.regularPrice != null,
                    ),
                    const SizedBox(height: 10),
                    ClassInfo(
                      title: '쿠폰수업',
                      description: couponPriceDescription,
                      exist: widget.couponPrice != null,
                    ),
                    const SizedBox(height: 10),
                    ClassInfo(
                      title: '작품반',
                      description: widget.pieceClassDescription ?? '작품 수업이 없어요',
                      exist: widget.pieceClassDescription != null,
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
}
