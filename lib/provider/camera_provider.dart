import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/utils/camera_helper.dart';

final pathVideoProvider =
    StateProvider.autoDispose<String>((ref) => 'add_image');
final isPlayingProvider = StateProvider.autoDispose<bool>((ref) => false);
