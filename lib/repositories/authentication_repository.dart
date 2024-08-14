import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/repositories/models/user_model.dart';
import 'package:zamanix/utils/app_local_storage.dart';
import 'package:zamanix/utils/app_secure_storage.dart';

abstract class AuthenticationRepository {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> signUpWithEmailAndPassword(
    String fullname,
    String email,
    String password,
  );
  Future<void> signOut();
  Future<bool> isSignedIn();
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<UserModel> signUpWithEmailAndPassword(
    String fullname,
    String email,
    String password,
  ) async {
    try {
      log('AUTH: START SIGN UP!');
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user!;

      if (userCredential.additionalUserInfo!.isNewUser) {
        await _db.collection(AppDatabaseCollections.users).doc(user.uid).set({
          'email': email,
          'fullname': fullname,
        }).then((value) => log('AUTH: USER CREATED! | DETAIL: $user'));
      } else {
        log('AUTH: USER ALREADY EXISTS!');
      }

      log('AUTH: SIGN UP SUCCESS!');
      return UserModel(
        email: email,
        fullname: fullname,
      );
    } on FirebaseAuthException catch (e) {
      log('AUTH: SIGN UP ERROR! | DETAIL: ${e.message}');
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception(e.message);
    } catch (e) {
      log('AUTH: SIGN UP ERROR! | DETAIL: $e');
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      log('AUTH: START SIGN IN!');
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user!;
      final DocumentSnapshot<Map<String, dynamic>> userDoc = await _db
          .collection(AppDatabaseCollections.users)
          .doc(user.uid)
          .get();
      final UserModel userModel = UserModel.fromJson(userDoc.data()!);

      log('AUTH: SIGN IN SUCCESS! | DETAIL: $user');
      await AppSecureStorage()
          .replaceSecureData('uid', user.uid)
          .then((value) => log('AUTH: UID SAVED! | DETAIL: $user.uid'));
      await AppLocalStorage()
          .writeData('profile', userModel.toJson())
          .then((value) => log('AUTH: PROFILE SAVED!'));
      return userModel;
    } on FirebaseAuthException catch (e) {
      log('AUTH: SIGN IN ERROR! | DETAIL: ${e.message}');
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      throw Exception(e.message);
    } catch (e) {
      log('AUTH: SIGN IN ERROR! | DETAIL: $e');
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      log('AUTH: START SIGN OUT!');
      await _firebaseAuth.signOut();
      log('AUTH: SIGN OUT SUCCESS!');
    } catch (e) {
      log('AUTH: SIGN OUT ERROR! | DETAIL: $e');
      throw Exception(e);
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      log('AUTH: START IS SIGNED IN!');
      if (currentUser != null) {
        log('AUTH: IS SIGNED IN SUCCESS! | DETAIL: $currentUser');
        return true;
      } else {
        log('AUTH: IS SIGNED IN FAILED! | DETAIL: No user found!');
        return false;
      }
    } catch (e) {
      log('AUTH: IS SIGNED IN ERROR! | DETAIL: $e');
      return false;
    }
  }
}
