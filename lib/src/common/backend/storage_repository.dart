import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rawdah/src/common/backend/general_providers.dart';
import 'package:rawdah/src/common/backend/auth_repository.dart';

class StorageRepository {
  // -- Variables --
  final Ref _ref;
  const StorageRepository(this._ref);

  // -- Methods --
  Future<String> uploadAvatar(Uint8List file) async {
    String uid = _ref.read(authRepositoryProvider).user!.uid;

    Reference ref =
        _ref.read(firebaseStorageProvider).ref().child('avatars').child(uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> upload({
    required String collection,
    required String id,
    required String fileName,
    required Uint8List file,
  }) async {
    Reference ref = _ref
        .read(firebaseStorageProvider)
        .ref()
        .child(collection)
        .child(id)
        .child(fileName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

final storageRepositoryProvider =
    Provider<StorageRepository>((ref) => StorageRepository(ref));
