import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

class UserModel extends Usr {
  const UserModel(
      {required super.email,
      required super.password,
      required super.id,
      super.name,
      super.profile});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        password: map['password'],
        id: map['id'],
        name: map['name'],
        profile: map['profile']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'profile': profile,
    };
  }
}
