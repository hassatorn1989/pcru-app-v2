part of 'maplist_bloc.dart';

enum MaplistStatus { initial, loading, loaded, failure }

final class MaplistState extends Equatable {
  final MaplistStatus status;
  final List<LocationModel> locations;
  final bool hasReachedMax;
  final int page;
  final String? message;

  const MaplistState({
    this.status = MaplistStatus.initial,
    this.locations = const <LocationModel>[],
    this.hasReachedMax = false,
    this.page = 1,
    this.message = '',
  });

  MaplistState copyWith({
    MaplistStatus? status,
    List<LocationModel>? locations,
    bool? hasReachedMax,
    int? page,
    String? message,
  }) {
    return MaplistState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, locations, hasReachedMax, page, message!];
}