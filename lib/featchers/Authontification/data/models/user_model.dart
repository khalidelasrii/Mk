import '../../domain/entitie/user.dart';

class UserModel extends Usr {
  const UserModel(
      {super.adress,
      super.payes,
      super.email,
      super.password,
      super.name,
      super.phoneNumber,
      super.profile,
      super.uid});

  Map<String, dynamic> toMap() {
    return {
      "payes": payes,
      "profile": profile,
      'phoneNumber': phoneNumber,
      'id': uid,
      'email': email,
      'name': name,
      'adress': adress,
      "password": password,
    };
  }
}
