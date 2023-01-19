import 'dart:async';

import 'package:location/location.dart';
import 'package:test_assignment/model/user_location.dart';
import '../model/location/location_model.dart';

class LocationService {
  final Location _location = Location();
  Location get location => _location;

  final StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>();
  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  LocationService() {
    // _location.requestPermission().then((permissionStatus) => {
    //       if (permissionStatus == PermissionStatus.granted)
    //         {
    //           _location.onLocationChanged.listen((locationData) {
    //             _locationStreamController.add(UserLocation(
    //                 latitude: locationData.latitude.toString(),
    //                 longitude: locationData.longitude.toString()));
    //           })
    //         }
    //     });
  }

  FutureOr<PermissionStatus> getPermission() {
    return location.requestPermission();
  }

  Stream<LocationModel> getLocation() async* {
    var locationCurrent = location.onLocationChanged;
    await for (final locationTransform in locationCurrent) {
      yield LocationModel().copyWith(
          latitude: locationTransform.latitude ?? 0,
          longitude: locationTransform.longitude ?? 0);
    }
  }

  // disposeLocation() {
  //   _locationStreamController.close();
  // }
}
