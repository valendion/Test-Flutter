import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/model/location/location_model.dart';

final inputLocationProvider =
    StateProvider<LocationModel>(((ref) => LocationModel()));
