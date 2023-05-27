import 'package:ballet_for_all_flutter/repository/city/city.dart';
import 'package:ballet_for_all_flutter/repository/city/district.dart';
import 'package:faker/faker.dart';

import 'district_generator.dart';

City generateCity({String? name, List<District>? districts}) => City(
      name: name ?? faker.address.city(),
      districts: districts ??
          random.amount(
            (_) => generateDistrict(),
            5,
            min: 2,
          ),
    );
