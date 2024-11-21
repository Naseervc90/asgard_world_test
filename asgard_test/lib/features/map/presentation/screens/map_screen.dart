import 'package:asgard_test/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/bloc/map_bloc.dart';
import '../../blocs/bloc/map_event.dart';
import '../../blocs/bloc/map_state.dart';
import '../../models/view_type.dart';
import '../widgets/custom_fab.dart';
import '../widgets/view_type_indicator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: MapConstants.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Map'),
        elevation: 2,
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                initialCameraPosition: const CameraPosition(
                  target: MapConstants.initialPosition,
                  zoom: MapConstants.initialZoom,
                ),
                markers: state.markers,
                mapType: MapType.normal,
              ),
              Positioned(
                top: 16,
                left: 16,
                child: ViewTypeIndicator(
                  viewType: state.viewType,
                  animation: _animation,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: ViewType.values.map((viewType) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomFAB(
              viewType: viewType,
              onPressed: () => _onViewTypeChanged(viewType),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onViewTypeChanged(ViewType viewType) {
    context.read<MapBloc>().add(ChangeViewType(viewType));
    _controller.reset();
    _controller.forward();
  }
}
