import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'document_path.dart';

class FirebaseStorageService {
  FirebaseStorageService({required this.uid});
  final String uid;

  /// Upload an avatar from file
  Future<String> uploadAvatar({
    required File file,
  }) async =>
      await upload(
        file: file,
        path: DocumentPath.newproduct(uid) + '/avatar.png',
        contentType: 'image/png',
      );

  /// Generic file upload for any [path] and [contentType]
  Future<String> upload({
    required File file,
    required String path,
    required String contentType,
  }) async {
    if (kDebugMode) {
      print('uploading to: $path');
    }
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
        file, SettableMetadata(contentType: contentType));
    final snapshot = uploadTask.snapshot;

    // Url used to download file/image
    final downloadUrl = await snapshot.ref.getDownloadURL();
    if (kDebugMode) {
      print('downloadUrl: $downloadUrl');
    }
    return downloadUrl;
  }
}
