import '../../domain/entitie/user.dart';

class UserModel extends Usr {
  const UserModel(
      {super.adress,
      super.payes,
      required super.email,
      super.password,
      required super.name,
      super.phoneNumber,
      required super.profileUrl,
      required super.uid});

  Map<String, dynamic> toMap() {
    return {
      "payes": payes,
      "profileUrl": profileUrl,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'email': email,
      'name': name,
      'adress': adress,
      "password": password,
    };
  }
}
