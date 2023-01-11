import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isResendOtp = StateProvider.autoDispose(((ref) => false));

final phoneNumberProvider = StateProvider((ref) => '');
final timerProvider = StateProvider.autoDispose((ref) => 30);

final userProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());
