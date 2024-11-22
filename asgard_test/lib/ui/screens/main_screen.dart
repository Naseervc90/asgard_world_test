import 'package:asgard_test/blocs/map_bloc/map_state.dart';
import 'package:asgard_test/blocs/theme_bloc/theme_bloc.dart';
import 'package:asgard_test/models/location.dart';
import 'package:asgard_test/ui/widgets/location_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/map_bloc/map_bloc.dart';
import '../../blocs/map_bloc/map_event.dart';
import '../widgets/map_toggle_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    context.read<MapBloc>().add(LoadLocations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleTheme());
            },
          ),
        ],
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(40.7128, -74.0060),
                  zoom: 12,
                ),
                onMapCreated: (controller) {
                  _mapController = controller;
                },
                markers: _buildMarkers(state),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: MapToggleButtons(
                  selectedType: state.selectedType,
                  onTypeSelected: (type) {
                    context.read<MapBloc>().add(FilterLocations(type));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Set<Marker> _buildMarkers(MapState state) {
    _markers.clear();

    final locations = state.selectedType == null
        ? state.locations
        : state.locations.where((l) => l.type == state.selectedType).toList();

    for (var location in locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location.id),
          position: location.position,
          onTap: () {
            _showLocationDetails(location);
          },
        ),
      );
    }

    return _markers;
  }

  void _showLocationDetails(Location location) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LocationBottomSheet(location: location),
    );
  }
}
