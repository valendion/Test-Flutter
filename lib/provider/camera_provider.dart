import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pathVideoProvider =
    StateProvider.autoDispose<String>((ref) => 'add_image');
final isPlayingProvider = StateProvider.autoDispose<bool>((ref) => false);
