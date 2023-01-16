import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment/pages/add_page.dart';
import 'package:test_assignment/pages/phone_input_page.dart';
import 'package:test_assignment/utils/auth_services.dart';

class HomePage extends StatelessWidget {
  static var routeName = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Assignment'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
            onPressed: () async {
              try {
                await AuthServices.authSignOut().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PhoneInputPage.routeName, ((route) => false));
                });
              } on FirebaseAuthException catch (e) {
                debugPrint('Logout ${e.toString()}');
              } catch (e) {
                debugPrint('Error ${e.toString()}');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              Navigator.pushNamed(context, AddPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
