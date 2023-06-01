import 'package:ballet_for_all_flutter/repository/academy/pricing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pricing', () {
    test('(numberPerWeek == null && totalCount == null) 일 경우 에러를 던진다', () {
      expect(
        () => Pricing(
          numberPerWeek: null,
          totalCount: null,
          durationInMonth: 1,
          classTimeInMinutes: 30,
          plan: '쿠폰반',
          originalPrice: 100000,
          salePrice: 50000,
          discountPercent: 50,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('(numberPerWeek != null && totalCount != null) 일 경우 에러를 던진다', () {
      expect(
        () => Pricing(
          numberPerWeek: 1,
          totalCount: 1,
          durationInMonth: 1,
          classTimeInMinutes: 30,
          plan: '쿠폰반',
          originalPrice: 100000,
          salePrice: 50000,
          discountPercent: 50,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('(numberPerWeek != null && totalCount == null) 일 수 있다.', () {
      expect(
        () => const Pricing(
          numberPerWeek: 1,
          totalCount: null,
          durationInMonth: 1,
          classTimeInMinutes: 30,
          plan: '쿠폰반',
          originalPrice: 100000,
          salePrice: 50000,
          discountPercent: 50,
        ),
        returnsNormally,
      );
    });

    test('(numberPerWeek == null && totalCount != null) 일 수 있다.', () {
      expect(
        () => const Pricing(
          numberPerWeek: null,
          totalCount: 1,
          durationInMonth: 1,
          classTimeInMinutes: 30,
          plan: '쿠폰반',
          originalPrice: 100000,
          salePrice: 50000,
          discountPercent: 50,
        ),
        returnsNormally,
      );
    });
  });
}
