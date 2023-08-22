import 'package:mk/featchers/Authontification/data/models/user_model.dart';
import 'package:mk/featchers/Authontification/domain/entitie/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDataSources {
  Future<Map> signIn(Usr usr);
  Future<Map> signUp(Usr usr);
}

class UserDataSourcesImpl1 implements UserDataSources {
  final firebase = FirebaseAuth.instance;

  @override
  Future<Map> signIn(Usr usr) async {
    await firebase.signInWithEmailAndPassword(
        email: usr.email!, password: usr.password!);

    final usrsign = UserModel(
      email: firebase.currentUser!.email,
      password: '',
      id: firebase.currentUser!.uid,
      profile: firebase.currentUser!.photoURL,
      name: firebase.currentUser!.displayName,
    );
    return usrsign.toMap();
  }

  @override
  Future<Map> signUp(Usr usr) async {
    await firebase.createUserWithEmailAndPassword(
        email: usr.email!, password: usr.password!);
    final usrsingup = UserModel(
        id: firebase.currentUser!.uid,
        email: firebase.currentUser!.email,
        password: '');
    return usrsingup.toMap();
  }
}
