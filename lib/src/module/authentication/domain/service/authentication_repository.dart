import 'package:app_foody/src/module/authentication/domain/model/user_data.dart';

abstract class AuthenticationRepository {
   Future<AppUser?> signInWithEmailAndPassword(String email, String password);

   Future<AppUser?> signUpWithEmailAndPassword(String email, String password);

   Future<AppUser?> getUser();
}
