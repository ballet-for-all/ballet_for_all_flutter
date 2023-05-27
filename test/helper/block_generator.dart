import 'package:ballet_for_all_flutter/repository/city/block.dart';
import 'package:faker/faker.dart';

Block generateBlock({String? name}) => Block(
      name: name ?? faker.address.streetName(),
    );
