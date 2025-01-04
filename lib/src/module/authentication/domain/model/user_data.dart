abstract class AppUser {
  final String userID;
  final String email;

  String get role;

  AppUser(this.userID, this.email);
}

class User extends AppUser {
  User(super.userID, super.email);

  @override
  String get role => 'user';
}

class Admin extends AppUser {
  Admin(super.userID, super.email);

  @override
  String get role => 'admin';
}
