import 'package:flutter/material.dart';

import 'class_info.dart';

class AcademyItem extends StatelessWidget {
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
        child: InkWell(
          onTap: () {
            // TODO(ghrud92): 학원 상세 페이지로 이동
          },
          child: Column(
            children: [
              // TODO(ghrud92): 캐러셀 패키지 사용
              SizedBox(
                width: double.infinity,
                height: 219,
                child: Image.network(
                  academyImages.first,
                  fit: BoxFit.fitWidth,
                ),
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                academyAddress,
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
                            description: '회당 $regularPrice원~',
                          ),
                        ),
                        Expanded(
                          child: ClassInfo(
                            title: '쿠폰수업',
                            // TODO(ghrud92): 가격에 , 추가
                            description: '회당 $couponPrice원~',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClassInfo(
                      title: '작품수업',
                      description: '$pieceClass 외 $pieceClassExtraNum개',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
