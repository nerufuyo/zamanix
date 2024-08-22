import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
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
  final Logger _logger = Logger();

  @override
  Future<UserModel> signUpWithEmailAndPassword(
    String fullname,
    String email,
    String password,
  ) async {
    try {
      _logger.i('START SIGN UP');
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
        });
        _logger.i('USER CREATED | UID: ${user.uid}');
      } else {
        _logger.i('USER ALREADY EXISTS');
      }

      _logger.i('SIGN UP SUCCESS');
      return UserModel(email: email, fullname: fullname);
    } on FirebaseAuthException catch (e) {
      _logger.e('SIGN UP ERROR', error: e);
      throw _handleAuthException(e);
    } catch (e) {
      _logger.e('SIGN UP ERROR', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      _logger.i('START SIGN IN');
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

      await AppSecureStorage().replaceSecureData('uid', user.uid);
      _logger.i('UID SAVED | UID: ${user.uid}');
      await AppLocalStorage().writeData('profile', userModel.toJson());
      _logger.i('PROFILE SAVED');

      _logger.i('SIGN IN SUCCESS');
      return userModel;
    } on FirebaseAuthException catch (e) {
      _logger.e('SIGN IN ERROR', error: e);
      throw _handleAuthException(e);
    } catch (e) {
      _logger.e('SIGN IN ERROR', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      _logger.i('START SIGN OUT');
      await _firebaseAuth.signOut();
      _logger.i('SIGN OUT SUCCESS');
    } catch (e) {
      _logger.e('SIGN OUT ERROR', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      _logger.i('CHECK IS SIGNED IN');
      if (currentUser != null) {
        _logger.i('IS SIGNED IN SUCCESS | UID: ${currentUser.uid}');
        return true;
      } else {
        _logger.i('IS SIGNED IN FAILED | No user found');
        return false;
      }
    } catch (e) {
      _logger.e('IS SIGNED IN ERROR', error: e);
      return false;
    }
  }

  Exception _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return Exception('The password provided is too weak.');
      case 'email-already-in-use':
        return Exception('The account already exists for that email.');
      case 'user-not-found':
        return Exception('No user found for that email.');
      case 'wrong-password':
        return Exception('Wrong password provided for that user.');
      default:
        return Exception(e.message);
    }
  }
}
