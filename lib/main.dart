import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/add_delet_update/addordeletorupdate_bloc.dart';
import 'package:mk/featchers/Article/presentation/bloc/article/article_bloc.dart';
import 'package:mk/featchers/Authontification/presentation/bloc/auth/auth_bloc.dart';
import 'featchers/Authontification/presentation/ui/sing_in.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBxlxB-nnjgEN542jqPvQrQo9O9KhgO9D8",
      authDomain: "milotech-33497.firebaseapp.com",
      projectId: "milotech-33497",
      storageBucket: "milotech-33497.appspot.com",
      messagingSenderId: "1090838931629",
      appId: "1:1090838931629:web:64efe23033a1a187277e24",
    ),
  );
  await di.init();
  runApp(const Maktabati());
}

class Maktabati extends StatelessWidget {
  const Maktabati({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<ArticleBloc>()..add(GetAllArticlesEvent()),
          ),
          BlocProvider(
            create: (_) => di.sl<AddordeletorupdateBloc>(),
          ),
          BlocProvider(
            create: (_) => di.sl<AuthBloc>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(focusColor: Colors.blue),
          home: const SingIn(),
        ));
  }
}
