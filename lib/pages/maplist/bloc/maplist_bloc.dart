import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pcru_app/models/location_model.dart';
import 'package:pcru_app/repository/location_repository.dart';

part 'maplist_event.dart';
part 'maplist_state.dart';

class MaplistBloc extends Bloc<MaplistEvent, MaplistState> {
  MaplistBloc() : super(const MaplistState()) {
    on<MaplistEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MaplistFetched>((event, emit) async {
      if (state.hasReachedMax) return;
      try {
        if (state.status == MaplistStatus.initial) {
          final response = await LocationRepository().getLocationsPage(state.page);
          List<LocationModel> locationList = (response['data'] as List)
              .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
              .toList();
          emit(state.copyWith(
            status: MaplistStatus.loaded,
            locations: locationList,
            hasReachedMax: false,
          ));
        } else if (state.status == MaplistStatus.loaded) {
          final response = await LocationRepository()
              .getLocationsPage(state.page + 1);
          List<LocationModel> locationList = (response['data'] as List)
              .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
              .toList();
          emit(state.copyWith(
            status: MaplistStatus.loaded,
            locations: List.of(state.locations)..addAll(locationList),
            hasReachedMax: false,
            page: state.page + 1,
          ));
        }
      } catch (_) {
        emit(state.copyWith(
            status: MaplistStatus.failure, message: 'ขออภัย! มีข้อผิดพลาด'));
      }
    });
  }
}
