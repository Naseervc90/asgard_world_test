import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/view_type.dart';

class MapRepository {
  Future<Set<Marker>> getMarkersForViewType(ViewType viewType) async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    final Set<Marker> markers = {};
    final position = const LatLng(51.5074, -0.1278);

    markers.add(
      Marker(
        markerId: MarkerId('${viewType.name}_1'),
        position: position,
        infoWindow: InfoWindow(title: '${viewType.name} Location 1'),
      ),
    );

    return markers;
  }
}
