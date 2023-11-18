import '../../domaine/entitie/profile_user.dart';

class ProfileModel extends ProfileUser {
  const ProfileModel(
      {required super.email, super.name, super.number, super.type, super.user});

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "number": number,
      "type": type,
      "user": user,
    };
  }
}
