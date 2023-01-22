import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_assignment/model/location/location_model.dart';
import 'package:test_assignment/model/user/user_model.dart';
import 'package:test_assignment/model/video/video_model.dart';

class FirestoreServices {
  late FirebaseFirestore dbFirestore;

  String _nameCollection = '';
  set nameCollection(String name) => _nameCollection = name;
  String get nameCollection => _nameCollection = _nameCollection;

  FirestoreServices() {
    dbFirestore = FirebaseFirestore.instance;
  }

  Future<String> addDataFirestore(UserModel userModel) async {
    try {
      CollectionReference refUser = dbFirestore.collection(nameCollection);
      await refUser
          .add(userModel.toJson())
          .then((value) => debugPrint('User Add'));
      return 'User add';
    } catch (e) {
      debugPrint(e.toString());
      return 'User failed add';
    }
  }

  Stream<List<UserModel>> getDataFireStore() async* {
    var snapshot = dbFirestore.collection(nameCollection).snapshots();
    await for (final querySnapshot in snapshot) {
      yield querySnapshot.docs.map((e) {
        return UserModel.fromJson(e.data());
      }).toList();
    }
  }
}
