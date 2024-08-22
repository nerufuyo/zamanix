import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
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
  final Logger _logger = Logger();

  @override
  Future<UserModel> getUser() async {
    _logger.i('GET USER STARTED');
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot<Map<String, dynamic>> userDoc = await _db
            .collection(AppDatabaseCollections.users)
            .doc(currentUser.uid)
            .get();

        final UserModel userModel = UserModel.fromJson(userDoc.data()!);
        _logger.i('GET USER SUCCESS | DETAIL: $userModel');
        return userModel;
      } else {
        _logger.e('GET USER ERROR | No user found');
        throw Exception('No user found!');
      }
    } catch (e) {
      _logger.e('GET USER ERROR', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    _logger.i('UPDATE USER STARTED');
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await _db
            .collection(AppDatabaseCollections.users)
            .doc(currentUser.uid)
            .update(user.toJson());
        _logger.i('UPDATE USER SUCCESS | DETAIL: $user');
        return user;
      } else {
        _logger.e('UPDATE USER ERROR | No user found');
        throw Exception('No user found!');
      }
    } catch (e) {
      _logger.e('UPDATE USER ERROR', error: e);
      throw Exception(e);
    }
  }

  @override
  Future<UserModel> deleteUser(UserModel user) async {
    _logger.i('DELETE USER STARTED');
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await _db
            .collection(AppDatabaseCollections.users)
            .doc(currentUser.uid)
            .delete();
        _logger.i('DELETE DATABASE USER SUCCESS');

        await currentUser.delete();
        _logger.i('DELETE USER SUCCESS');

        return user;
      } else {
        _logger.e('DELETE USER ERROR | No user found');
        throw Exception('No user found!');
      }
    } catch (e) {
      _logger.e('DELETE USER ERROR', error: e);
      throw Exception(e);
    }
  }
}
