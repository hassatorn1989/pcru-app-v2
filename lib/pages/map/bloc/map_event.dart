part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

final class MapFetched extends MapEvent {}

final class MapDetailFetched extends MapEvent {
  final String id;

  const MapDetailFetched({required this.id});

  @override
  List<Object> get props => [id];
}
