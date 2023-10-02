import '../../domain/entitie/user.dart';

class UserModel extends Usr {
  const UserModel(
      {required super.adress,
      required super.payes,
      required super.email,
      required super.password,
      super.name,
      super.phoneNumber,
      super.profile,
      super.uid});

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'email': email,
      'name': name,
      'adress': adress,
      'phone': phoneNumber,
    };
  }
}
