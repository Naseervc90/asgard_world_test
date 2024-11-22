import 'package:google_maps_flutter/google_maps_flutter.dart';

enum LocationType { cycle, shopping, restaurant }

class Location {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final LocationType type;
  final LatLng position;

  Location({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.type,
    required this.position,
  });
}
