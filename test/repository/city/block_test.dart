import 'package:ballet_for_all_flutter/repository/city/block.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Block', () {
    group('toJson', () {
      test('Block 객체는 json Map으로 변환된다', () {
        const block = Block(name: '부전동');

        expect(block.toJson(), {'name': '부전동'});
      });
    });

    group('fromJson', () {
      test('name 필드가 있는 Map 객체는 Block 객체로 변환된다', () {
        const Map<String, dynamic> json = {'name': '부전동'};

        const expected = Block(name: '부전동');
        expect(Block.fromJson(json), expected);
      });

      test('name 필드가 없는 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {};

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => Block.fromJson(json), throwsA(isA<Error>()));
      });

      test('추가적인 필드가 있는 Map 객체는 Block 객체로 변환된다.', () {
        const Map<String, dynamic> json = {
          'name': '부전동',
          'additionalField': '추가적인 필드',
        };

        const expected = Block(name: '부전동');
        expect(Block.fromJson(json), expected);
      });
    });
  });
}
