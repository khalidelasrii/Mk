import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:mk/featchers/Authontification/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDataSources {
  Future<Usr> signIn(Usr usr);
  Future<Usr> signUp(Usr usr);
}

class UserDataSourcesImpl1 implements UserDataSources {
  final firebase = FirebaseAuth.instance;

  @override
  Future<Usr> signIn(Usr usr) async {
    await firebase.signInWithEmailAndPassword(
        email: usr.email!, password: usr.password!);

    final usrsign = Usr(
      email: firebase.currentUser!.email,
      password: '',
      id: firebase.currentUser!.uid,
      profile: firebase.currentUser!.photoURL,
      name: firebase.currentUser!.displayName,
    );
    return usrsign;
  }

  @override
  Future<Usr> signUp(Usr usr) {
    throw UnimplementedError();
  }
}
