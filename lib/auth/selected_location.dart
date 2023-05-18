import 'package:equatable/equatable.dart';

class SelectedLocation extends Equatable {
  const SelectedLocation({this.city, this.district, this.block});

  final String? city;
  final String? district;
  final String? block;
  
  @override
  List<Object?> get props => [city, district, block];
}
