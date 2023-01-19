import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class StorageServices {
  final Reference _storage = FirebaseStorage.instance.ref();
  Reference get storage => _storage;

  Future<String> uploadVideo(String pathVideo) async {
    late String linkDownload;

    String fileName = basename(pathVideo);

    var ref = storage.child(fileName);
    var task = await ref.putFile(File(pathVideo));
    if (task.state == TaskState.success) {
      linkDownload = await ref.getDownloadURL();
    }

    return linkDownload;
  }
}
