import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/repositories/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> deleteUser(UserModel user);
}

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<UserModel> getUser() async {
    log('USER: GET USER STARTED!');
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot<Map<String, dynamic>> userDoc = await _db
            .collection(AppDatabaseCollections.users)
            .doc(currentUser.uid)
            .get();

        final UserModel userModel = UserModel.fromJson(userDoc.data()!);
        log('USER: GET USER SUCCESS! | DETAIL: $userModel');
        return userModel;
      } else {
        log('USER: GET USER ERROR! | DETAIL: No user found!');
        throw Exception('No user found!');
      }
    } catch (e) {
      log('USER: GET USER ERROR! | DETAIL: $e');
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    log('USER: UPDATE USER STARTED!');
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await _db
            .collection(AppDatabaseCollections.users)
            .doc(currentUser.uid)
            .update(user.toJson())
            .then((value) => log('USER: UPDATE USER SUCCESS! | DETAIL: $user'));
        return user;
      } else {
        log('USER: UPDATE USER ERROR! | DETAIL: No user found!');
        throw Exception('No user found!');
      }
    } catch (e) {
      log('USER: UPDATE USER ERROR! | DETAIL: $e');
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> deleteUser(UserModel user) async {
    log('USER: DELETE USER STARTED!');
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await _db
            .collection(AppDatabaseCollections.users)
            .doc(currentUser.uid)
            .delete()
            .then((value) => log('USER: DELETE DATABASE USER SUCCESS!'));
        await currentUser
            .delete()
            .then((value) => log('USER: DELETE USER SUCCESS!'));

        return user;
      } else {
        log('USER: DELETE USER ERROR! | DETAIL: No user found!');
        throw Exception('No user found!');
      }
    } catch (e) {
      log('USER: DELETE USER ERROR! | DETAIL: $e');
      throw Exception(e);
    }
  }
}
