part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();
  
  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {}

// Map List
final class MapLoading extends MapState {}

final class MapLoaded extends MapState {
  final List<MapModel> maps;

  const MapLoaded({required this.maps});

  @override
  List<Object> get props => [maps];
}

final class MapFailure extends MapState {
  final String error;

  const MapFailure({required this.error});

  @override
  List<Object> get props => [error];
}

// Map Detail
final class MapDetailLoading extends MapState {}

final class MapDetailLoaded extends MapState {
  final MapModel map;

  const MapDetailLoaded({required this.map});

  @override
  List<Object> get props => [map];
}

final class MapDetailFailure extends MapState {
  final String error;

  const MapDetailFailure({required this.error});

  @override
  List<Object> get props => [error];
}



