import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/pages/home_page.dart';
import 'package:test_assignment/pages/phone_input_page.dart';
import 'package:test_assignment/provider/otp_provider.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();

//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user != null && user.phoneNumber != null) {
//         Navigator.of(context).pushReplacementNamed('/home');
//       } else {
//         Navigator.of(context).pushReplacementNamed('/phone');
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

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
      error: (e, s) => Text('error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
