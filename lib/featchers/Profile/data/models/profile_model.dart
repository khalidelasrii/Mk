import '../../domaine/entitie/profile_user.dart';

class ProfileModel extends ProfileUser {
  const ProfileModel(
      {required super.email,
      super.name,
      super.type,
      super.phoneNumber,
      super.password,
      super.uid,
      super.adress,
      super.payes,
      super.profile});

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "type": type,
      "phoneNumber": phoneNumber,
      "password": password,
      "uid": uid,
      "adress": adress,
      "payes": payes,
      "profile": profile,
    };
  }
}
