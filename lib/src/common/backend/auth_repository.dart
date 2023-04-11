import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rawdah/src/common/backend/general_providers.dart';
import 'package:rawdah/src/common/backend/storage_repository.dart';
import 'package:rawdah/src/common/domain/fire_user.dart';
import 'package:rawdah/src/utils/utils.dart';

class AuthRepository {
  // -- Variables --
  final Ref ref;
  const AuthRepository(this.ref);

  // -- Methods --
  Stream<User?> get authStateChange =>
      ref.read(firebaseAuthProvider).authStateChanges();

  User? get user => ref.read(firebaseAuthProvider).currentUser;

  // -- Methods | Login --
  Future<void> sendSmsToLogin(
    String phoneNumber,
    VoidCallback callback,
  ) async {
    try {
      // Отправляем СМС
      final result = await ref
          .read(firebaseFunctionsProvider)
          .httpsCallable("sendSms")
          .call({"phoneNumber": phoneNumber});
      final json = jsonDecode(result.data);

      final status = json["status"];
      final message = json["message"];

      if (status == "error") {
        Utils.showSnackBar("error with number: $message");
      } else {
        // ignore: avoid_print
        print("sended code $message");
        callback();
      }
    } catch (error) {
      Utils.showSnackBar("errror sendSMStoLogin: ${error.toString()}");
    }
  }

  Future<UserCredential?> verifyNumber(
    String phoneNumber,
    String code,
  ) async {
    try {
      // Мы проверяем что код сходить в бд с кодом отправленной СМСки
      final result = await ref
          .read(firebaseFunctionsProvider)
          .httpsCallable("checkCode")
          .call({
        "phoneNumber": phoneNumber,
        "code": code,
      });
      final json = jsonDecode(result.data);

      final status = json["status"];
      final message = json["message"];

      if (status == "error") {
        Utils.showSnackBar("error to verify $message");
        return null;
      }

      UserCredential userCredential =
          await ref.read(firebaseAuthProvider).signInWithCustomToken(message);
      return userCredential;
    } catch (error) {
      Utils.showSnackBar("errror verifyNumber: ${error.toString()}");
      return null;
    }
  }

  Future<String> createUser(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      }
    } catch (e) {
      throw (e.toString());
    }
    throw 'not found error';
  }

  Future<String> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      } else {
        throw (e.code);
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  // -- Sign Up --
  Future<String> signUp({
    required FireUser user,
    required Uint8List? avatar,
    required WidgetRef widgetRef,
  }) async {
    String response = "Some error occured";

    try {
      String? avatarURL;
      if (avatar == null) {
        avatarURL = null;
      } else {
        avatarURL = await widgetRef
            .read(storageRepositoryProvider)
            .uploadAvatar(avatar);
      }

      user.avatarURL = avatarURL;

      DocumentReference docRef =
          ref.read(firebaseFirestoreProvider).collection('users').doc(user.uid);
      await docRef.set(user.toMap());
      response = "success";
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        response = 'The email is badly formatted';
      } else if (error.code == 'weak-password') {
        response = 'Password should be at least 6 characters';
      }
    } catch (error) {
      response = error.toString();
    }

    return response;
  }

  signOut() async {
    await ref.read(firebaseAuthProvider).signOut();
  }
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref));
