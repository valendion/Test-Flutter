import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_assignment/utils/firestore_services.dart';

import '../model/user/user_model.dart';

final getFirestoreProvider =
    StreamProvider.autoDispose<List<UserModel>>(((ref) {
  var fireStoreServices = FirestoreServices();
  fireStoreServices.nameCollection = 'users';
  return fireStoreServices.getDataFireStore();
}));
