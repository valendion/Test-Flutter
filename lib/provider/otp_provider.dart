import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/utils/auth_services.dart';

final isResendOtp = StateProvider.autoDispose(((ref) => false));

final phoneNumberProvider = StateProvider((ref) => '');
final timerProvider = StateProvider.autoDispose((ref) => 30);

final userProvider =
    StreamProvider<User?>((ref) => AuthServices.authStateChange());
