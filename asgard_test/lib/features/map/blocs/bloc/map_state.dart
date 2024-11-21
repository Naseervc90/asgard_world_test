import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/view_type.dart';

class MapState extends Equatable {
  final ViewType viewType;
  final Set<Marker> markers;

  const MapState({
    this.viewType = ViewType.cycle,
    this.markers = const {},
  });

  MapState copyWith({
    ViewType? viewType,
    Set<Marker>? markers,
  }) {
    return MapState(
      viewType: viewType ?? this.viewType,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object> get props => [viewType, markers];
}
