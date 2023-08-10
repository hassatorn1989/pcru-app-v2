import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcru_app/pages/maplist/bloc/maplist_bloc.dart';

class MaplistPage extends StatefulWidget {
  const MaplistPage({ Key? key }) : super(key: key);

  @override
  _MaplistPageState createState() => _MaplistPageState();
}

class _MaplistPageState extends State<MaplistPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //       title: const Text('Maplist')),
    //   body: const Center(
    //     child: Text('Maplist Page'),
    //   ),
    // );

    return BlocProvider(
        create: (context) => MaplistBloc()..add(MaplistFetched()),
        child: BlocConsumer<MaplistBloc, MaplistState>(
          listener: (context, state) {
            if (state is MaplistFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is MaplistInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MaplistLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MaplistLoaded) {
              return Scaffold(
                appBar: AppBar(
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    title: const Text('Maplist')),
                body: Container(
                  child: Center(
                    child:  Text('Maplist Page 5555'),
                  ),
                )
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
    );
  }
}