import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pcru_app/models/map_model.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<MapEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MapFetched>((event, emit) {
        emit(MapLoading());
        emit(MapLoaded(maps: []));
    });
    
  }
}
