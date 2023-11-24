import 'package:mk/featchers/Authontification/domain/entitie/user.dart';

abstract class RepositoryAuth {
  Future<void> singIn(Usr usr);
  Future<void> singUp(Usr usr);
  Future<void> signInWithGoogle();
  Future<void> singOut();
}
