import 'package:get/get.dart';

import '../../repository/academy/academy.dart';
import '../../repository/academy/location.dart';
import '../../repository/academy/sns.dart';
import '../../repository/academy/teacher.dart';

class AcademyController extends GetxController {
  AcademyController();

  final academy = Rxn<Academy>();

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments;
    fetchAcademy(id as String);
  }

  Future<void> fetchAcademy(String id) async {
    // TODO(ghrud92): 실제 데이터 사용하기
    const sns = Sns(
      kakaoTalk: 'as바디',
      naverBlog: 'https://blog.naver.com/as_body_',
    );
    const images = [
      'https://postfiles.pstatic.net/MjAxOTEyMTBfOCAg/MDAxNTc1OTQwMDI0MDAx.ObMsgZPsRS2VVVAWJzgNqfPhJdn5ZFXiQRqqmwRqVaUg.eABLgYjBRfZ3uicgIsvF53oYzWrEN7pi2FqVw1LDQkog.JPEG.as_body_/KakaoTalk_20191210_100308613.jpg?type=w773',
      'https://postfiles.pstatic.net/MjAxOTEyMTBfMjc1/MDAxNTc1OTQwMDI0MDA3.EucNW6U_r8ymqpFUonvMsyfItbEq_mMfzRipNnDFJZ8g.bEXv4UCDVIZ0s5TtDIiPaedsBe1DhWZ2KkxsTAiMe0Ug.JPEG.as_body_/KakaoTalk_20191210_100309422.jpg?type=w773',
      'https://postfiles.pstatic.net/MjAxOTEyMTBfMjc3/MDAxNTc1OTQwMDI0MDEy.FOKbSOgHWNk0oeEvu2A4xjewIg6BCaH92Pq19RqaSeAg.sM5jcYTvFiRaY51UB_Q6HcJtpEOrOnAGBden95fDdiEg.JPEG.as_body_/KakaoTalk_20191210_100309522.jpg?type=w773',
      'https://postfiles.pstatic.net/MjAxOTEyMTBfMTg3/MDAxNTc1OTQwMDI0MDA3.l26dD-TdHWMOVEvONzwICYJmRzr58JDRTUzuEDjWos8g.Cd80_IuUO8T9x4RExncYvTDT-O442eGFWCJ4tOfo4BQg.JPEG.as_body_/KakaoTalk_20191210_100310205.jpg?type=w773',
      'https://postfiles.pstatic.net/MjAxOTEyMTBfNzkg/MDAxNTc1OTU0NDI2MjEy.M92m_FjQPdgOLT7ZdA14Nw_jMy-zVmFCcdzrMD-nLA4g.0fkCeAUX-rq5DKuQQZxASuHfUdo9PvWTQbHE-u9U6rEg.JPEG.as_body_/GNY_0981.JPG?type=w773',
    ];
    final teachers = [
      const Teacher(
        name: '김종열',
        description: ''' - 프로필 -

08년 러시아 국립 보리스에이프만 발레단 연수과정 수료
10년 러시아 국립 보리스에이프만 발레단 연수과정 수료

10년 강원대학교 무용과 학사졸업 (전체장학)
19년 강원대학원 무용과 석사졸업



09년 국립발레단 준/연수단원
10년 국립발레단 단원 수석합격
12년 국립발레단 코리페 수석합격
15년~ 국립발레단 드미솔리스트


- 공연이력 -

국립발레단 [라비방데르] 2010 주역무용수
국립발레단 [Knb무브먼트] 2012 주역무용수
국립발레단 [J씨의 사랑이야기] 2012 주역무용수
국립발레단 [할리퀴나드] 2012 주역무용수
국립발레단 [지젤] 2014 주역무용수
국립발레단 [베니스카니발] 2015 주역무용수
발레류보브 [지젤] 2010 주역무용수
발레류보브 [코펠리아] 2011 주역무용수
발레류보브 [백조의호수] 2012 주역무용수
발레류보브 [해적] 201<…>
flutter: Teacher(정유미, 학력

-성균관대학교 무용학과 졸업(우수장학)
-성균관대학교 일반대학원 무용학과 졸업


자격 및 경력

-바가노바 발레 교수법 LV1~LV6 수료
-스탓 필라테스 국제지도사 자격증
-요가지도사 자격증
-브니엘 예술고등학교 무용과 교사
-황현정 무용학원 입시반 발레 지도자
-서희경 무용학원 유아,전공반 발레 강사
-온디느 무용학원 입시반 발레 지도자​

무용과 합격자 배출

-선화예중.고 덕원예고 예원예중
-계원예고, 서울예고, 국립국악중,고
-입시생 지도경력 11년(매년 합격자 배출)
-예중, 예고, 대학, 콩쿨작품 전문 지도자''',
        imageUrl:
            'https://postfiles.pstatic.net/MjAxOTEyMTBfOTYg/MDAxNTc1OTM5MDIzNjEz.m8tR-PH7AcFvQobn26Lc5DZaBZcWguGkewERtgId53Eg.ZA0Q0VIjCd5W9a7xem70lvWUBqrSPK9UuKBBMgpvq2sg.JPEG.as_body_/%EC%A0%95%EC%9C%A0%EB%AF%B8.jpg?type=w773',
      ),
      const Teacher(
          name: '김은정',
          description: '''학력

-서강대학교 졸업


자격 및 경력
-국제 재활 필라테스 소도구/매트 자격증
-barrel,reformet,chair,cadilac 자격증
-요가테스 지도사 자격증
-방송댄스 지도사 자격증
-스트릿댄스 지도사 자격증
-체육댄스 지도사 자격증
-재활PT 지도경력 다수 헬스 트레이너''',
          imageUrl:
              'https://postfiles.pstatic.net/MjAxOTEyMTBfMjc4/MDAxNTc1OTM4Njg2NTky.5gOcsQpmKR9h68hM6MpPZRpmf1DQ605Or3Rf5jdgNGMg.YQf1AQTmu4PDnTOnBaXpV_wD2u4NzVmyoP6B6rQujaQg.JPEG.as_body_/%EC%82%AC%EB%B3%B8_-%EA%B9%80%EC%9D%80%EC%A0%95%EA%B0%95%EC%82%AC.jpg?type=w773'),
    ];
    final dummyAcademy = Academy(
      id: id,
      name: '에이에스바디 도곡본점',
      address: '서울 강남구 논현로28길 53 대하빌딩 2층',
      phone: const ['010-2345-2876', '02-6338-2345'],
      sns: sns,
      coupon: false,
      images: images,
      teachers: teachers,
      timetables: const [],
      pricing: const [],
      pricingDescription: null,
      location: const Location(
        lat: 37.4848834756983,
        lng: 127.045970824358,
        city: '서울',
        district: '강남구',
        block: '도곡동',
      ),
    );
    academy.value = dummyAcademy;
  }
}
