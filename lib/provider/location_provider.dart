import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:test_assignment/model/location/location_model.dart';
import 'package:test_assignment/utils/location_services.dart';

final locationService = Provider((ref) => LocationService());

final permissionLocationProvider = FutureProvider<PermissionStatus>(((ref) {
  return ref.read(locationService).getPermission();
}));

final locationProvider = StreamProvider<LocationModel>(((ref) {
  return ref.read(locationService).getLocation();
}));
