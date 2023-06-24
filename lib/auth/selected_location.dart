import 'package:equatable/equatable.dart';

class SelectedLocation extends Equatable {
  const SelectedLocation({this.city, this.district, this.block});

  final String? city;
  final String? district;
  final String? block;

  String get deepestLocation {
    if (block != null) {
      return block!;
    } else if (district != null) {
      return district!;
    } else {
      return city!;
    }
  }

  @override
  List<Object?> get props => [city, district, block];
}
