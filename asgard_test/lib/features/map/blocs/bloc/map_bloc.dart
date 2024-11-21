import 'package:asgard_test/features/map/blocs/bloc/map_event.dart';
import 'package:asgard_test/features/map/blocs/bloc/map_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/map_repository.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _repository = MapRepository();

  MapBloc() : super(const MapState()) {
    on<ChangeViewType>(_onChangeViewType);
  }

  Future<void> _onChangeViewType(
      ChangeViewType event, Emitter<MapState> emit) async {
    final markers = await _repository.getMarkersForViewType(event.viewType);
    emit(state.copyWith(
      viewType: event.viewType,
      markers: markers,
    ));
  }
}
