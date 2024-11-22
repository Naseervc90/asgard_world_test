import 'package:asgard_test/blocs/map_bloc/map_event.dart';
import 'package:asgard_test/blocs/map_bloc/map_state.dart';
import 'package:asgard_test/models/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<LoadLocations>(_onLoadLocations);
    on<FilterLocations>(_onFilterLocations);
    on<ClearFilter>(_onClearFilter);
  }

  void _onLoadLocations(LoadLocations event, Emitter<MapState> emit) {
    emit(state.copyWith(isLoading: true));

    // Mock data - replace with actual API call
    final locations = [
      Location(
        id: '1',
        name: 'Central Park Cycling',
        description: 'Bike rental and cycling paths',
        type: LocationType.cycle,
        position: const LatLng(40.785091, -73.968285),
      ),
      Location(
        id: '2',
        name: 'Mall of America',
        description: 'Large shopping complex',
        type: LocationType.shopping,
        position: const LatLng(40.758896, -73.985130),
      ),
      Location(
        id: '3',
        name: 'Star bucks',
        description: 'Large shopping complex',
        type: LocationType.restaurant,
        position: const LatLng(40.758974, -73.974261),
      ),
      // Add more locations...
    ];

    emit(state.copyWith(
      locations: locations,
      isLoading: false,
    ));
  }

  void _onFilterLocations(FilterLocations event, Emitter<MapState> emit) {
    emit(state.copyWith(selectedType: event.type));
  }

  void _onClearFilter(ClearFilter event, Emitter<MapState> emit) {
    emit(state.copyWith(selectedType: null));
  }
}
