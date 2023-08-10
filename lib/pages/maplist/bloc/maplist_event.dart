part of 'maplist_bloc.dart';

sealed class MaplistEvent extends Equatable {
  const MaplistEvent();

  @override
  List<Object> get props => [];
}

final class MaplistFetched extends MaplistEvent {}

final class MaplistRefreshed extends MaplistEvent {}

final class MaplistSearched extends MaplistEvent {
  final String query;

  const MaplistSearched({required this.query});

  @override
  List<Object> get props => [query];
}
