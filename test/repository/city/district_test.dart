import 'package:ballet_for_all_flutter/repository/city/block.dart';
import 'package:ballet_for_all_flutter/repository/city/district.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helper/block_generator.dart';

void main() {
  group('District', () {
    group('toJson', () {
      test('District 객체는 json Map으로 변환된다', () {
        final blocks = [generateBlock(), generateBlock()];
        final district = District(
          name: 'district_name',
          blocks: blocks,
        );

        expect(district.toJson(), {
          'name': 'district_name',
          'blocks': blocks.map((block) => block.toJson()).toList(),
        });
      });
    });

    group('fromJson', () {
      test('name 필드가 없는 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {
          'blocks': [
            {'name': 'block0'},
            {'name': 'block1'},
          ]
        };

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => District.fromJson(json), throwsA(isA<Error>()));
      });

      test('blocks 필드가 없는 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {
          'name': 'district_name',
        };

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => District.fromJson(json), throwsA(isA<Error>()));
      });

      test('blocks 필드가 List가 아닌 Map 객체는 Error를 던진다', () {
        const Map<String, dynamic> json = {
          'name': 'district_name',
          'blocks': {},
        };

        // NOTE: 실제 에러는 _CastError 지만 그건 잡아낼 수 없기에 Error로 확인한다.
        expect(() => District.fromJson(json), throwsA(isA<Error>()));
      });

      test('name, blocks 필드가 있는 Map 객체는 District 객체로 변환된다', () {
        const Map<String, dynamic> json = {
          'name': 'district_name',
          'blocks': [
            {'name': 'block0'},
            {'name': 'block1'},
          ],
        };

        const expected = District(
          name: 'district_name',
          blocks: [
            Block(name: 'block0'),
            Block(name: 'block1'),
          ],
        );
        expect(District.fromJson(json), expected);
      });

      test('추가적인 필드가 있는 Map 객체는 District 객체로 변환된다.', () {
        const Map<String, dynamic> json = {
          'name': 'district_name',
          'blocks': [
            {'name': 'block0'},
            {'name': 'block1'},
          ],
          'additionalField': '추가적인 필드',
        };

        const expected = District(
          name: 'district_name',
          blocks: [
            Block(name: 'block0'),
            Block(name: 'block1'),
          ],
        );
        expect(District.fromJson(json), expected);
      });
    });
  });
}
