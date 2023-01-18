import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/model/user_location.dart';

final inputLocationProvider = StateProvider<UserLocation>(
    ((ref) => UserLocation(latitude: 0, longitude: 0)));
