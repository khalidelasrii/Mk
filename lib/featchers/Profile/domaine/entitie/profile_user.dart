import '../../../Authontification/domain/entitie/user.dart';

class ProfileUser extends Usr {
  const ProfileUser(
      {required super.email,
      required super.name,
      required super.uid,
      super.adress,
      super.password,
      super.payes,
      super.phoneNumber,
      super.profileUrl});

  @override
  List<Object?> get props =>
      [email, name, uid, profileUrl, phoneNumber, payes, password, adress];
}
