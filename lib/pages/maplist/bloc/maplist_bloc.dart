import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pcru_app/models/map_model.dart';

part 'maplist_event.dart';
part 'maplist_state.dart';

class MaplistBloc extends Bloc<MaplistEvent, MaplistState> {
  MaplistBloc() : super(MaplistInitial()) {
    on<MaplistEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MaplistFetched>((event, emit) {
      emit(MaplistLoading());
      emit(MaplistLoaded(maps: []));
    });
  }
}
