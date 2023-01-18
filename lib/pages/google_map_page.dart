import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_assignment/model/user_location.dart';

import '../provider/input_text.dart';

class MapSample extends ConsumerStatefulWidget {
  static var routeName = '/googleMapPage';
  const MapSample({Key? key}) : super(key: key);

  @override
  ConsumerState<MapSample> createState() => MapSampleState();
}

class MapSampleState extends ConsumerState<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    var location = ref.read(inputLocationProvider);

    CameraPosition _currentPosition = CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 22,
    );

    List<UserLocation> userLocations = [location];

    // CameraPosition _kLake = CameraPosition(
    //     bearing: 192.8334901395799,
    //     target: LatLng(location.latitude, location.longitude),
    //     tilt: 59.440717697143555,
    //     zoom: 20);

    // Future<void> _goToTheLake() async {
    //   final GoogleMapController controller = await _controller.future;
    //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    // }

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: userLocations.map((e) => _customMarker(e)).toSet(),
        initialCameraPosition: _currentPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Text('Add your location'),
        icon: const Icon(Icons.location_searching),
      ),
    );
  }

  Marker _customMarker(UserLocation e) => Marker(
        markerId: MarkerId(e.hashCode.toString()),
        draggable: true,
        position: LatLng(e.latitude, e.longitude),
        onDragEnd: (value) {
          ref.read(inputLocationProvider.notifier).state = UserLocation(
              latitude: value.latitude, longitude: value.longitude);
        },
      );
}
