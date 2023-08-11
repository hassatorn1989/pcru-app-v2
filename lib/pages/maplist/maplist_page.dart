import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcru_app/pages/maplist/bloc/maplist_bloc.dart';

class MaplistPage extends StatefulWidget {
  const MaplistPage({ Key? key }) : super(key: key);

  @override
  _MaplistPageState createState() => _MaplistPageState();
}

class _MaplistPageState extends State<MaplistPage> {
  final _scrollController = ScrollController();

    @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MaplistBloc()..add(MaplistFetched()),
        child: BlocConsumer<MaplistBloc, MaplistState>(
          listener: (context, state) {
            if(state.status == MaplistStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('asdasd'))
              );
            }
          },
          builder: (context, state) {
            print(state.locations);
            return Container(
              child: Center(
                child:  Text('Maplist Page 5555'),
              ),
            );
          },
        ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MaplistBloc>().add(MaplistFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}