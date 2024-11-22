import 'package:asgard_test/models/location.dart';
import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLocations extends MapEvent {}

class FilterLocations extends MapEvent {
  final LocationType type;

  FilterLocations(this.type);

  @override
  List<Object?> get props => [type];
}

class ClearFilter extends MapEvent {}
