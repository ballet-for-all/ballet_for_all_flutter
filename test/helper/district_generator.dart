import 'package:ballet_for_all_flutter/repository/city/block.dart';
import 'package:ballet_for_all_flutter/repository/city/district.dart';
import 'package:faker/faker.dart';

import 'block_generator.dart';

District generateDistrict({String? name, List<Block>? blocks}) => District(
      name: name ?? faker.address.city(),
      blocks: blocks ?? random.amount((_) => generateBlock(), 5, min: 2),
    );
