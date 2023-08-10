part of 'maplist_bloc.dart';

sealed class MaplistState extends Equatable {
  const MaplistState();
  
  @override
  List<Object> get props => [];
}

final class MaplistInitial extends MaplistState {}

// Map List
final class MaplistLoading extends MaplistState {}

final class MaplistLoaded extends MaplistState {
  final List<MapModel> maps;

  const MaplistLoaded({required this.maps});

  @override
  List<Object> get props => [maps];
}

final class MaplistFailure extends MaplistState {
  final String error;

  const MaplistFailure({required this.error});

  @override
  List<Object> get props => [error];
}