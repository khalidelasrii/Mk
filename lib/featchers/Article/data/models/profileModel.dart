import 'package:mk/featchers/Article/domain/entitie/profile.dart';

class ProfileModel extends Profile {
  ProfileModel({
    super.message,
    required super.email,
    required super.id,
    required super.numberPhone,
    required super.payes,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'date': DateTime.now(),
      'email': email,
    };
  }
}
