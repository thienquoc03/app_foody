import 'package:app_foody/common/service/cache_service.dart';
import 'package:app_foody/src/module/authentication/domain/model/user_data.dart'
    as app;
import 'package:app_foody/src/module/authentication/domain/service/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  @override
  Future<app.AppUser?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final res = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (res.user == null) return null;

    final token = await res.user!.getIdToken();

    if (token != null) {
      CacheService.saveToken(token);
      final doc = await fireStore.collection('user').doc(res.user!.uid).get();
      final data = doc.data();
      if (data?['role'] == 'admin') {
        return app.Admin(
          data?['user_id'] ?? '',
          data?['email'] ?? '',
        );
      }
      return app.User(
        data?['user_id'] ?? '',
        data?['email'] ?? '',
      );
    }

    return null;
  }

  @override
  Future<app.AppUser?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final res = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (res.user == null) return null;

    final token = await res.user!.getIdToken();

    if (token != null) {
      CacheService.saveToken(token);
      await fireStore.collection('user').doc(res.user!.uid).set({
        'user_id': res.user!.uid,
        'email': res.user!.email,
        'role': 'user',
      });

      return app.User(
        res.user!.uid,
        res.user!.email!,
      );
    }

    return null;
  }

  @override
  Future<app.AppUser?> getUser() async {
    final uid = firebaseAuth.currentUser!.uid;
    final doc = await fireStore.collection('user').doc(uid).get();
    final data = doc.data();
    if (data?['role'] == 'admin') {
      return app.Admin(
        data?['user_id'] ?? '',
        data?['email'] ?? '',
      );
    }
    return app.User(
      data?['user_id'] ?? '',
      data?['email'] ?? '',
    );
  }
}
