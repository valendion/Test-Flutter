import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
            onPressed: () {
              try {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacementNamed(context, '/');
                });
              } on FirebaseAuthException catch (e) {
                debugPrint('Logout ${e.toString()}');
              }
            },
          ),
        ],
      ),
    );
  }
}
