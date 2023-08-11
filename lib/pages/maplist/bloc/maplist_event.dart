part of 'maplist_bloc.dart';

sealed class MaplistEvent extends Equatable {
  const MaplistEvent();

  @override
  List<Object> get props => [];
}

final class MaplistFetched extends MaplistEvent {}