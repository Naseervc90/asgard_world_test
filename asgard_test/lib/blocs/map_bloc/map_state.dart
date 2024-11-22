import 'package:asgard_test/models/location.dart';
import 'package:equatable/equatable.dart';

class MapState extends Equatable {
  final List<Location> locations;
  final LocationType? selectedType;
  final bool isLoading;
  final String? error;

  const MapState({
    this.locations = const [],
    this.selectedType,
    this.isLoading = false,
    this.error,
  });

  MapState copyWith({
    List<Location>? locations,
    LocationType? selectedType,
    bool? isLoading,
    String? error,
  }) {
    return MapState(
      locations: locations ?? this.locations,
      selectedType: selectedType ?? this.selectedType,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [locations, selectedType, isLoading, error];
}
