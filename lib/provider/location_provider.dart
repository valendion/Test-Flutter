import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/model/location/location_model.dart';
import 'package:test_assignment/utils/location_services.dart';

final locationService = Provider((ref) => LocationService());

final locationProvider = StreamProvider.autoDispose<LocationModel>(((ref) {
  final location = ref.read(locationService).getLocation();
  return location;
}));
