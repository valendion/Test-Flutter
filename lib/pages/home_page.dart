import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/common/widget/card_items.dart';
import 'package:test_assignment/model/user/user_model.dart';
import 'package:test_assignment/pages/add_page.dart';
import 'package:test_assignment/pages/phone_input_page.dart';
import 'package:test_assignment/provider/firestore_provider.dart';
import 'package:test_assignment/utils/auth_services.dart';

class HomePage extends ConsumerWidget {
  static var routeName = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> numbers = [1, 2, 4, 5, 6, 7, 8, 9, 10];
    var fireStore = ref.watch(getFirestoreProvider);
    // debugPrint(fireStore.toString());
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
        // body: Column(
        //   children: [
        //     Expanded(
        //       child: ListView.builder(
        //           itemCount: numbers.length,
        //           shrinkWrap: true,
        //           itemBuilder: ((context, index) {
        //             return cardItems(index);
        //           })),
        //     )
        //   ],
        // ),
        body: Column(
          children: [
            fireStore.when(data: ((data) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return cardItems(data[index]);
                      }));
            }), error: (error, stackTrace) {
              return Container();
            }, loading: () {
              return CircularProgressIndicator();
            })
          ],
        )
        //  fireStore.when(
        //     data: (data) {
        //       debugPrint(data.length.toString());
        //       return Expanded(
        //         child: ListView.builder(
        //           itemCount: data.length,
        //           itemBuilder: (BuildContext context, int index) {
        //             return cardItems(data[index]);
        //           },
        //         ),
        //       );
        //     },
        //     error: (e, s) {},
        //     loading: (() {})),
        );
  }
}
