import '../../domain/entitie/user.dart';

class UserModel extends Usr {
  const UserModel(
      {required super.email,
      required super.password,
      super.name,
      super.phoneNumber,
      super.profile,
      super.uid});
}
