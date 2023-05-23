import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'class_info.dart';

class AcademyItem extends StatefulWidget {
  const AcademyItem({
    // TODO(ghrud92): 실제 데이터 적용
    this.academyImages = const [
      'https://picsum.photos/200/300',
      'https://picsum.photos/200/300',
      'https://picsum.photos/200/300',
    ],
    this.academyName = '이화본발레',
    this.academyAddress = '서울시 영등포구 영등포동4가 123 가나빌딩 4층',
    this.regularPrice = 50000,
    this.couponPrice = 60000,
    this.pieceClass = '백조의 호수',
    this.pieceClassExtraNum = 2,
    Key? key,
  }) : super(key: key);

  final List<String> academyImages;
  final String academyName;
  final String academyAddress;
  final int regularPrice;
  final int couponPrice;
  final String pieceClass;
  final int pieceClassExtraNum;

  @override
  State<AcademyItem> createState() => _AcademyItemState();
}

class _AcademyItemState extends State<AcademyItem> {
  late final CarouselController _carouselController;

  int _imageIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
        child: InkWell(
          onTap: () {
            // TODO(ghrud92): 학원 상세 페이지로 이동
          },
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 219,
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        onPressed: () => _carouselController.previousPage(),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                        onPressed: () => _carouselController.nextPage(),
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.academyAddress,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF999999),
                                ),
                                overflow: TextOverflow.ellipsis,
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
                    Row(
                      children: [
                        Expanded(
                          child: ClassInfo(
                            title: '정규수업',
                            // TODO(ghrud92): 가격에 , 추가
                            description: '회당 ${widget.regularPrice}원~',
                          ),
                        ),
                        Expanded(
                          child: ClassInfo(
                            title: '쿠폰수업',
                            // TODO(ghrud92): 가격에 , 추가
                            description: '회당 ${widget.couponPrice}원~',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClassInfo(
                      title: '작품수업',
                      description:
                          '${widget.pieceClass} 외 ${widget.pieceClassExtraNum}개',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
