import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_client.dart';
import '../firestore_collection.dart';

class FirestoreAcademiesCollection extends FirestoreCollection {
  FirestoreAcademiesCollection(FirestoreClient client)
      : _ref = client.firestore.collection(_collectionName);

  static const String _collectionName = 'academies';
  final CollectionReference _ref;

  /// @return
  /// [
  ///  {
  ///   id: 'DUijcPiWNTlw2L1JqwWU', // Firestore document ID
  ///   name: '발레아카데미',
  ///   address: '서울특별시 강남구 역삼동',
  ///   phone: ['02-123-4567', '010-1234-5678'],
  ///   sns: {
  ///    kakaoTalk: 'https://open.kakao.com/o/123456789',
  ///    naverTalkTalk: null,
  ///    homepage: null,
  ///    naverModoo: null,
  ///    naverBlog: 'https://blog.naver.com/balletacademy',
  ///    naverCafe: 'https://cafe.naver.com/balletacademy',
  ///    instagram: 'https://www.instagram.com/balletacademy',
  ///    facebook: 'https://www.facebook.com/balletacademy'
  ///   },
  ///   coupon: true,
  ///   images: [
  ///    'https://image-url-0.jpg',
  ///    'https://image-url-1.jpg'
  ///   ],
  ///   teachers: [
  ///    {
  ///     name: '홍길동',
  ///     description: '발레를 20년 이상 가르치고 있는 베테랑 선생님입니다.',
  ///     imageUrl: 'https://image-url.jpg'
  ///    },
  ///    ...
  ///   ],
  ///   timetables: [
  ///    {
  ///     timetableName: '주간반',
  ///     classes: [
  ///      {
  ///       className: '초급반',
  ///       classTag: [
  ///        1,
  ///        2
  ///       ],
  ///       schedules: [
  ///        {
  ///         startTime: '10:00',
  ///         durationInMinutes: 60,
  ///         day: '금요일',
  ///         teacherName: '홍길동'
  ///        },
  ///        ...
  ///       ]
  ///      },
  ///      ...
  ///     ]
  ///    },
  ///    ...
  ///   ],
  ///   pricing: [
  ///    {
  ///     numberPerWeek: 1,
  ///     totalCount: null,
  ///     durationInMonth: 1,
  ///     classTimeInMinutes: 60,
  ///     plan: '정규수업',
  ///     originalPrice: 100000,
  ///     salePrice: 80000,
  ///     discountPercent: 0.2
  ///    },
  ///    ...
  ///   ],
  ///   pricingDescription: '정규수업은 매주 1회, 1개월 동안 진행됩니다.',
  ///   location: {
  ///    lat: 37.123456,
  ///    lng: 127.123456,
  ///    city: '서울특별시',
  ///    district: '강남구',
  ///    block: '역삼동'
  ///   }
  ///  },
  ///  ...
  /// ]
  Future<List<Map<String, dynamic>>> getAcademies() async {
    final snapshot = await _ref.get();
    final academies = snapshot.docs.map((doc) => docToMap(doc)).toList();
    return academies;
  }
}
