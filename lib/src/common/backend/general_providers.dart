import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Firebase Auth
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// Firebase Functions
final firebaseFunctionsProvider =
    Provider<FirebaseFunctions>((ref) => FirebaseFunctions.instance);

// Firebase Firestore
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// Firebase Storage
final firebaseStorageProvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);
