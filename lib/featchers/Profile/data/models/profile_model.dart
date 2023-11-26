import '../../domaine/entitie/profile_user.dart';

class ProfileModel extends ProfileUser {
  const ProfileModel(
      {required super.email,
      super.phoneNumber,
      super.password,
      super.adress,
      super.payes,
      super.profileUrl,
      required super.name,
      required super.uid});

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "phoneNumber": phoneNumber,
      "password": password,
      "uid": uid,
      "adress": adress,
      "payes": payes,
      "profile": profileUrl,
    };
  }
}
