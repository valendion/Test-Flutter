import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/pages/home_page.dart';
import 'package:test_assignment/pages/phone_input_page.dart';
import 'package:test_assignment/provider/otp_provider.dart';

class SplashPage extends ConsumerWidget {
  static var routeName = '/';
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return user.when(
      data: (user) {
        return (user != null) ? const HomePage() : const PhoneInputPage();
      },
      error: (e, s) => const Text('error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
