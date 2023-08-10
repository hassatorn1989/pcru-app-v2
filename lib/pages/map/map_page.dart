import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pcru_app/pages/map/bloc/map_bloc.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc()..add(MapFetched()),
      child: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          if (state is MapFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is MapInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            const CameraPosition _kGooglePlex = CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 14.4746,
            );
            const CameraPosition _kLake = CameraPosition(
                // bearing: 192.8334901395799,
                target: LatLng(37.43296265331129, -122.08832357078792),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414);

            return Scaffold(
              body: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                  final GoogleMapController controller = await _controller.future;
                  await controller
                      .animateCamera(CameraUpdate.newCameraPosition(_kLake));
                },
                label: const Text('To the lake!'),
                icon: const Icon(Icons.directions_boat),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
