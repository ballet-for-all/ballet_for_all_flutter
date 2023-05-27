import 'package:faker/faker.dart';

Object? toNullable(Object? value) => random.element([value, null]);
